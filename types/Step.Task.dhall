let Config = ./Step.Task.Config.dhall : Type

let StepHook = ./Step.Hook.Step.dhall : Type

in    { task :
          Text
      , config :
          Optional Config
      , file :
          Optional Text
      , privileged :
          Optional Bool
      , params :
          Optional (List { mapKey : Text, mapValue : Text })
      , image :
          Optional Text
      , input_mapping :
          Optional (List { mapKey : Text, mapValue : Text })
      , output_mapping :
          Optional (List { mapKey : Text, mapValue : Text })
      , on_success :
          Optional StepHook
      , on_failure :
          Optional StepHook
      , on_abort :
          Optional StepHook
      , ensure :
          Optional StepHook
      }
    : Type
