{- Adapted from https://concourse-ci.org/pipelines.html

Generates the following pipeline YAML:

jobs:
  - name: hello-world
    plan:
      - config:
          image_resource:
            source:
              repository: alpine
            type: docker-image
          platform: linux
          run:
            args:
              - "Hello, world!"
            path: echo
        task: say-hello
-}
let imports =
      { DockerImage = ../resource-types/DockerImage.dhall
      , Task = ../Task.dhall
      , Step = ../Step.dhall
      , Job = ../Job.dhall
      , Pipeline = ../Pipeline.dhall
      }

let DockerImageResource =
      imports.Task.ImageResource
        { source = imports.DockerImage.Source.Type
        , get_params = <>
        , version = <>
        }

let TaskConfig =
      imports.Task.Config { image_resource = DockerImageResource.Type }

let Task =
      imports.Step.Task (imports.Step.Hookless ∧ { config = TaskConfig.Type })

let Job = imports.Job (imports.Step.Hookless ∧ { plan = Task.Type })

let Pipeline =
      imports.Pipeline
        { job = Job.Type, resource = <>, resource_type = <>, var_source = <> }

in  Pipeline::{
    , jobs = Some
      [ Job::{
        , name = "hello-world"
        , plan =
          [ Task::{
            , task = "say-hello"
            , config = Some TaskConfig::{
              , platform = "linux"
              , image_resource = DockerImageResource::{
                , type = imports.DockerImage.meta.name
                , source = imports.DockerImage.Source::{ repository = "alpine" }
                }
              , run = imports.Task.Run::{
                , path = "echo"
                , args = Some [ "Hello, world!" ]
                }
              }
            }
          ]
        }
      ]
    }
