let S3Bucket = ../../types/resources/S3Bucket.dhall

let ResourceType = ../../types/ResourceType.dhall

let mkResourceType = ../ResourceType.dhall

let name = "s3bucket"

let repository = "18fgsa/s3-resource-simple"

in  { version =
        {=} : S3Bucket.version.schema
    , params =
        { get =
            {=} : S3Bucket.params.get.schema
        , put =
            {=} : S3Bucket.params.put.schema
        }
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
          : S3Bucket.source.schema
    , meta =
        { name =
            name
        , repository =
            repository
        , resource_type =
              mkResourceType.DockerImage
              { name = name, repository = repository }
            : ResourceType
        }
    }
