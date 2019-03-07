let Input = ./Step.Task.Config.Input.dhall : Type

let Run = ./Step.Task.Config.Run.dhall : Type

let ImageResource = ./Step.Task.Config.ImageResource.dhall

let Output = ./Step.Task.Config.Output.dhall : Type

let Cache = ./Step.Task.Config.Cache.dhall : Type

in    { platform :
          Text
      , image_resource :
          Optional ImageResource.schema
      , inputs :
          Optional (List Input)
      , run :
          Run
      , rootfs_uri :
          Optional Text
      , outputs :
          Optional (List Output)
      , caches :
          Optional (List Cache)
      , params :
          Optional (List { mapKey : Text, mapValue : Text })
      }
    : Type
