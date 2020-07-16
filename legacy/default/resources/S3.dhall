let S3 = ../../types/resources/S3.dhall

let name = "s3"

in  { version =
          λ(_params : { version_id : Text })
        → { version_id = _params.version_id } : S3.version.schema
    , params =
        { get =
              { skip_download = None Bool, unpack = None Bool }
            : S3.params.get.schema
        , put =
              λ(_params : { file : Text })
            →   { file =
                    _params.file
                , acl =
                    None Text
                , content_type =
                    None Text
                }
              : S3.params.put.schema
        }
    , source =
          λ(_params : { bucket : Text })
        →   { bucket =
                _params.bucket
            , access_key_id =
                None Text
            , secret_access_key =
                None Text
            , session_token =
                None Text
            , region_name =
                None Text
            , private =
                None Bool
            , cloudfront_url =
                None Text
            , endpoint =
                None Text
            , disable_ssl =
                None Bool
            , skip_ssl_verification =
                None Bool
            , skip_download =
                None Bool
            , server_side_encryption =
                None Text
            , sse_kms_key_id =
                None Text
            , use_v2_signing =
                None Bool
            , disable_multipart =
                None Bool
            , regexp =
                None Text
            , versioned_file =
                None Text
            , initial_path =
                None Text
            , initial_version =
                None Text
            , initial_content_text =
                None Text
            , initial_content_binary =
                None Text
            }
          : S3.source.schema
    , meta =
        { name = name }
    }
