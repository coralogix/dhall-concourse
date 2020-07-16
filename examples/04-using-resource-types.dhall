{- Adapted from https://concourse-ci.org/pipelines.html

Generates the following pipeline YAML:

jobs:
  - name: announce
    plan:
      - get: booklit-releases
        trigger: true
resources:
  - name: booklit-releases
    source:
      url: http://www.qwantz.com/rssfeed.php
    type: rss

-}

let imports =
      { DockerImage = ../resource-types/DockerImage.dhall
      , Git = ../resource-types/Git.dhall
      , ResourceType = ../ResourceType.dhall
      , Resource = ../Resource.dhall
      , Task = ../Task.dhall
      , Step = ../Step.dhall
      , Job = ../Job.dhall
      , Pipeline = ../Pipeline.dhall
      }

let ResourceType =
      imports.ResourceType
        { Source = imports.DockerImage.Source.Type, SourceGetParams = <> }

let RSS =
    -- Not a supported resource type, so construct it manually in-line here
      { meta.name = "rss", Source = { Type = { url : Text }, default = {=} } }

let Resource = imports.Resource { Source = RSS.Source.Type, Version = <> }

let Get =
      imports.Step.Get
        (imports.Step.Hookless ∧ { get_params = <>, version = <> })

let Task = imports.Step.Task (imports.Step.Hookless ∧ { config = <> })

let Job = imports.Job (imports.Step.Hookless ∧ { plan = Get.Type })

let Pipeline =
      imports.Pipeline
        { job = Job.Type
        , resource = Resource.Type
        , resource_type = ResourceType.Type
        , var_source = <>
        }

let resources =
      { booklit-releases = Resource::{
        , name = "booklit-releases"
        , type = RSS.meta.name
        , source = RSS.Source::{ url = "http://www.qwantz.com/rssfeed.php" }
        }
      }

in  Pipeline::{
    , resources = Some [ resources.booklit-releases ]
    , jobs = Some
      [ Job::{
        , name = "announce"
        , plan =
          [ Get::{ get = resources.booklit-releases.name, trigger = Some True }
          ]
        }
      ]
    }
