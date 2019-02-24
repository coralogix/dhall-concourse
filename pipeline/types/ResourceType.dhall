  ∀(_params : { source : Type })
→   { name :
        Text
    , type :
        Text
    , privileged :
        Optional Bool
    , check_every :
        Optional Text
    , tags :
        Optional (List Text)
    , source :
        _params.source
    , params :
        Optional (List { mapKey : Text, mapValue : Text })
    }
  : Type
