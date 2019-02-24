let Job = ./Job.dhall : Type

let ResourceType = ./ResourceType.dhall : Type

let Resource = ./Resource.dhall : Type

let JobGroup = ./JobGroup.dhall : Type

in    { jobs :
          List Job
      , resources :
          Optional (List Resource)
      , resource_types :
          Optional (List ResourceType)
      , groups :
          Optional (List JobGroup)
      }
    : Type
