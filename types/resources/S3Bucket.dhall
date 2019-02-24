{ version_schema =
    {}
, get_params =
    {} : Type
, put_params =
    {} : Type
, source =
      { bucket :
          Text
      , path :
          Optional Text
      , options :
          Optional (List Text)
      , access_key_id :
          Optional Text
      , secret_access_key :
          Optional Text
      , region :
          Optional Text
      }
    : Type
}
