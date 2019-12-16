let Job = ./Job.dhall : Type

let Resource = ./Resource.dhall : Type

let ResourceType = ./ResourceType.dhall

let JobGroup = ./JobGroup.dhall : Type

in    { jobs : List Job
      , resources : Optional (List Resource)
      , resource_types : Optional (List ResourceType.schema)
      , groups : Optional (List JobGroup)
      }
    : Type
