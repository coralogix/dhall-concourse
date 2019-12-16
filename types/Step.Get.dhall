let Version = ./Version.dhall : Type

let StepHook = ./Step.Hook.Step.Box.dhall : Type

let Params = (./resources/_unions.dhall).params.get : Type

in    { get : Text
      , resource : Optional Text
      , version : Optional Version
      , passed : Optional (List Text)
      , params : Optional Params
      , trigger : Optional Bool
      , on_success : Optional StepHook
      , on_failure : Optional StepHook
      , on_abort : Optional StepHook
      , ensure : Optional StepHook
      }
    : Type
