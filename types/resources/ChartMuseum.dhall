{ version_schema =
    { version : Text, digest : Text }
, get_params =
    { target_basename : Optional Text } : Type
, put_params =
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
, source =
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
