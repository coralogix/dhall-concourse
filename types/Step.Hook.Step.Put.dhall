let Params = ./resources/_put_params.dhall : Type

let GetParams = ./resources/_get_params.dhall : Type

in    { put :
          Text
      , resource :
          Optional Text
      , params :
          Optional Params
      , get_params :
          Optional GetParams
      }
    : Type
