let Job = ../types/Job.dhall : Type

let Resource = ../types/Resource.dhall : Type

let ResourceType = ../types/ResourceType.dhall

let JobGroup = ../types/JobGroup.dhall : Type

let Pipeline = ../types/Pipeline.dhall : Type

in    λ(_params : { jobs : List Job })
    →   { jobs =
            _params.jobs
        , resources =
            None (List Resource)
        , resource_types =
            None (List ResourceType.schema)
        , groups =
            None (List JobGroup)
        }
      : Pipeline
