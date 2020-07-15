let TaskConfigOutput = ../types/Step.Task.Config.Output.dhall : Type

in    λ(_params : { name : Text })
    → { name = _params.name, path = None Text } : TaskConfigOutput
