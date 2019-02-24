let Input = ../types/Step.Hook.Step.Task.Config.Input.dhall : Type

in    λ(_params : { name : Text })
    → { name = _params.name, path = None Text, optional = None Bool } : Input
