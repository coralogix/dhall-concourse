let Run = ../types/Step.Hook.Step.Task.Config.Run.dhall : Type

in    λ(_params : { path : Text })
    →   { path =
            _params.path
        , args =
            None (List Text)
        , dir =
            None Text
        , user =
            None Text
        }
      : Run
