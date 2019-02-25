{ version =
    { schema = { version : Text, digest : Text } }
, params =
    { get =
        { schema = { target_basename : Optional Text } : Type }
    , put =
        { schema =
              { chart :
                  Text
              , force :
                  Optional Bool
              , version :
                  Optional Text
              , version_file :
                  Optional Text
              , sign :
                  Optional Bool
              , key_data :
                  Optional Text
              , key_file :
                  Optional Text
              , key_passphrase :
                  Optional Text
              }
            : Type
        }
    }
, source =
    { schema =
          { server_url :
              Text
          , chart_name :
              Text
          , version_range :
              Optional Text
          , basic_auth_username :
              Optional Text
          , basic_auth_password :
              Optional Text
          }
        : Type
    }
}
