let Time = ../../types/resources/Time.dhall

let name = "time"

in  { version =
          λ(_params : { version_id : Text })
        → { version_id = _params.version_id } : Time.version.schema
    , params =
        { get =
              { }
            : Time.params.get.schema
        , put =
              { }
            : Time.params.put.schema
        }
    , source =
        { interval =
            None Text
        , location =
            Some "UTC"
        , start =
            None Text
        , stop =
            None Text
        , days =
            None (List Text)
        }
          : Time.source.schema
    , meta =
        { name = name }
    }
