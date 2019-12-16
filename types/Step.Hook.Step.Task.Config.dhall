let Input = ./Step.Hook.Step.Task.Config.Input.dhall : Type

let Run = ./Step.Hook.Step.Task.Config.Run.dhall : Type

let ImageResource = ./Step.Hook.Step.Task.Config.ImageResource.dhall

let Output = ./Step.Hook.Step.Task.Config.Output.dhall : Type

let Cache = ./Step.Hook.Step.Task.Config.Cache.dhall : Type

in    { platform : Text
      , image_resource : Optional ImageResource.schema
      , inputs : Optional (List Input)
      , run : Run
      , rootfs_uri : Optional Text
      , outputs : Optional (List Output)
      , caches : Optional (List Cache)
      , params : Optional (List { mapKey : Text, mapValue : Text })
      }
    : Type
