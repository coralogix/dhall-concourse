let Version = ../types/Version.dhall : Type

let StepHook = ../types/Step.Hook.Step.dhall : Type

let Params = ../types/resources/_get_params.dhall : Type

let Get = ../types/Step.Get.dhall : Type

in    λ(_params : { get : Text })
    →   { get =
            _params.get
        , resource =
            None Text
        , version =
            None Version
        , passed =
            None (List Text)
        , params =
            None Params
        , trigger =
            None Bool
        , on_success =
            None StepHook
        , on_failure =
            None StepHook
        , on_abort =
            None StepHook
        , ensure =
            None StepHook
        }
      : Get
