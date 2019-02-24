let Params = ../types/resources/_put_params.dhall : Type

let GetParams = ../types/resources/_get_params.dhall : Type

let Put = ../types/Step.Hook.Step.Put.dhall : Type

in    λ(_params : { put : Text })
    →   { put =
            _params.put
        , resource =
            None Text
        , params =
            None Params
        , get_params =
            None GetParams
        }
      : Put
