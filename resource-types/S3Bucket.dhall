{ meta = { name = "s3bucket", repository = "18fgsa/s3-resource-simple" }
, Version = { Type = {}, default = {=} }
, Params =
  { Get = { Type = {}, default = {=} }, Put = { Type = {}, default = {=} } }
, Source =
    let Source =
          { Type =
              { bucket : Text
              , path : Optional Text
              , options : Optional (List Text)
              , access_key_id : Optional Text
              , secret_access_key : Optional Text
              , region : Optional Text
              }
          , default =
            { path = None Text
            , options = None (List Text)
            , access_key_id = None Text
            , secret_access_key = None Text
            , region = None Text
            }
          }

    let test = Source::{ bucket = "test" }

    in  Source
}
