let StepHook = ./Step.Hook.Step.dhall : Type

let Params = ./resources/_put_params.dhall : Type

let GetParams = ./resources/_get_params.dhall : Type

in    { put :
          Text
      , resource :
          Optional Text
      , params :
          Optional Params
      , get_params :
          Optional GetParams
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
