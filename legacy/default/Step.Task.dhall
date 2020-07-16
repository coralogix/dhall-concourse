let Config = ../types/Step.Task.Config.dhall : Type

let StepHook = ../types/Step.Hook.Step.Box.dhall : Type

let Task = ../types/Step.Task.dhall : Type

in    λ(_params : { task : Text })
    →   { task =
            _params.task
        , config =
            None Config
        , file =
            None Text
        , privileged =
            None Bool
        , params =
            None (List { mapKey : Text, mapValue : Text })
        , image =
            None Text
        , input_mapping =
            None (List { mapKey : Text, mapValue : Text })
        , output_mapping =
            None (List { mapKey : Text, mapValue : Text })
        , on_success =
            None StepHook
        , on_failure =
            None StepHook
        , on_abort =
            None StepHook
        , ensure =
            None StepHook
        }
      : Task
