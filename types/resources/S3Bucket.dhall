{ version = { schema = {} : Type }
, params = { get = { schema = {} : Type }, put = { schema = {} : Type } }
, source =
    { schema =
          { bucket : Text
          , path : Optional Text
          , options : Optional (List Text)
          , access_key_id : Optional Text
          , secret_access_key : Optional Text
          , region : Optional Text
          }
        : Type
    }
}
