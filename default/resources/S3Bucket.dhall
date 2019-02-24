let S3Bucket = ../../types/resources/S3Bucket.dhall

let ResourceType = ../../types/ResourceType.dhall

let mkResourceType = ../ResourceType.dhall

let name = "s3bucket"

in  { params =
        { get = {=} : S3Bucket.get_params, put = {=} : S3Bucket.put_params }
    , source =
          λ(_params : { bucket : Text })
        →   { bucket =
                _params.bucket
            , path =
                None Text
            , options =
                None (List Text)
            , access_key_id =
                None Text
            , secret_access_key =
                None Text
            , region =
                None Text
            }
          : S3Bucket.source
    , meta =
        { name =
            name
        , resource_type =
              mkResourceType.DockerImage
              { name = name, repository = "18fgsa/s3-resource-simple" }
            : ResourceType
        }
    }
