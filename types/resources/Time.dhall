{ version =
    { schema = { version_id : Text } : Type }
, params =
    { get =
        { schema =
            {} : Type
        }
    , put =
        { schema =
            {} : Type
        }
    }
, source =
    { schema =
          { interval :
              Optional Text
          , location :
              Optional Text
          , start    :
              Optional Text
          , stop     :
              Optional Text
          , days     :
              Optional (List Text)
          }
        : Type
    }
}

