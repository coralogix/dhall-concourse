let Config = ../types/Step.Hook.Step.Task.Config.dhall : Type

let Task = ../types/Step.Hook.Step.Task.dhall : Type

in    λ(_params : { task : Text })
    →   { task = _params.task
        , config = None Config
        , file = None Text
        , privileged = None Bool
        , params = None (List { mapKey : Text, mapValue : Text })
        , image = None Text
        , input_mapping = None (List { mapKey : Text, mapValue : Text })
        , output_mapping = None (List { mapKey : Text, mapValue : Text })
        }
      : Task
