let Params = (./resources/_unions.dhall).params.put : Type

let GetParams = (./resources/_unions.dhall).params.get : Type

in    { put : Text
      , resource : Optional Text
      , params : Optional Params
      , get_params : Optional GetParams
      }
    : Type
