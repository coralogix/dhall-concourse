{- Adapted from https://concourse-ci.org/pipelines.html

Generates the following pipeline YAML:

jobs:
  - name: unit
    plan:
      - get: booklit
        trigger: true
      - file: booklit/ci/test.yml
        task: run-unit
  - name: build
    plan:
      - get: booklit
        passed:
          - unit
        trigger: true
      - file: booklit/ci/build.yml
        task: run-build
resources:
  - name: booklit
    source:
      branch: master
      uri: https://github.com/vito/booklit
    type: git

-}

let imports =
      { Git = ../resource-types/Git.dhall
      , Resource = ../Resource.dhall
      , Task = ../Task.dhall
      , Step = ../Step.dhall
      , Job = ../Job.dhall
      , Pipeline = ../Pipeline.dhall
      }

let Resource =
      imports.Resource { Source = imports.Git.Source.Type, Version = <> }

let Get =
      imports.Step.Get
        (imports.Step.Hookless ∧ { get_params = <>, version = <> })

let Task = imports.Step.Task (imports.Step.Hookless ∧ { config = <> })

let Step = < Get : Get.Type | Task : Task.Type >

let Job = imports.Job (imports.Step.Hookless ∧ { plan = Step })

let Pipeline =
      imports.Pipeline
        { job = Job.Type
        , resource = Resource.Type
        , resource_type = <>
        , var_source = <>
        }

let resources =
      { booklit = Resource::{
        , name = "booklit"
        , type = imports.Git.meta.name
        , source = imports.Git.Source::{
          , uri = "https://github.com/vito/booklit"
          , branch = Some "master"
          }
        }
      }

let jobs =
      let template =
            λ ( _params
              : { name : Text, file-name : Text, passed : Optional (List Text) }
              ) →
              Job::{
              , name = _params.name
              , plan =
                [ Step.Get
                    Get::{
                    , get = resources.booklit.name
                    , passed = _params.passed
                    , trigger = Some True
                    }
                , Step.Task
                    Task::{
                    , task = "run-${_params.name}"
                    , file = Some
                        "${resources.booklit.name}/ci/${_params.file-name}"
                    }
                ]
              }

      let unit =
            template
              { name = "unit"
              , passed = None (List Text)
              , file-name = "test.yml"
              }

      let build =
            template
              { name = "build"
              , passed = Some [ unit.name ]
              , file-name = "build.yml"
              }

      in  { unit, build }

in  Pipeline::{
    , resources = Some [ resources.booklit ]
    , jobs = Some [ jobs.unit, jobs.build ]
    }
