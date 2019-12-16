let Params = (../types/resources/_unions.dhall).params.put : Type

let GetParams = (../types/resources/_unions.dhall).params.get : Type

let Put = ../types/Step.Hook.Step.Put.dhall : Type

in    λ(_params : { put : Text })
    →   { put = _params.put
        , resource = None Text
        , params = None Params
        , get_params = None GetParams
        }
      : Put
