let Input = ../types/Step.Hook.Step.Task.Config.Input.dhall : Type

let Run = ../types/Step.Hook.Step.Task.Config.Run.dhall : Type

let ImageResource = ../types/Step.Hook.Step.Task.Config.ImageResource.dhall

let TaskConfig = ../types/Step.Hook.Step.Task.Config.dhall : Type

let Output = ../types/Step.Hook.Step.Task.Config.Output.dhall : Type

let Cache = ../types/Step.Hook.Step.Task.Config.Cache.dhall : Type

in    λ(_params : { platform : Text, run : Run })
    →   { platform =
            _params.platform
        , image_resource =
            None ImageResource.schema
        , inputs =
            None (List Input)
        , run =
            _params.run
        , rootfs_uri =
            None Text
        , outputs =
            None (List Output)
        , caches =
            None (List Cache)
        , params =
            None (List { mapKey : Text, mapValue : Text })
        }
      : TaskConfig
