let Version = ./Version.dhall : Type

let Params = (./resources/_unions.dhall).params.get : Type

in    { get : Text
      , resource : Optional Text
      , version : Optional Version
      , passed : Optional (List Text)
      , params : Optional Params
      , trigger : Optional Bool
      }
    : Type
