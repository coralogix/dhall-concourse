let Version = ../types/Version.dhall : Type

let Params = (../types/resources/_unions.dhall).params.get : Type

let Get = ../types/Step.Hook.Step.Get.dhall : Type

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
        }
      : Get
