let JobGroup = ../types/JobGroup.dhall : Type

in    λ(_params : { name : Text })
    →   { name =
            _params.name
        , jobs =
            None (List Text)
        , resources =
            None (List Text)
        }
      : JobGroup
