let StepHook = ./Step.Hook.Step.Box.dhall : Type

let Params = (./resources/_unions.dhall).params.put : Type

let GetParams = (./resources/_unions.dhall).params.get : Type

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
