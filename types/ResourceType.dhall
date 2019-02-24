let Source = ./resources/_resource_type_sources.dhall

in    { name :
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
          Source
      , params :
          Optional (List { mapKey : Text, mapValue : Text })
      }
    : Type
