{ version =
    { schema = { version_id : Text } : Type }
, params =
    { get =
        { schema =
            { skip_download : Optional Bool, unpack : Optional Bool } : Type
        }
    , put =
        { schema =
              { file : Text, acl : Optional Text, content_type : Optional Text }
            : Type
        }
    }
, source =
    { schema =
          { bucket :
              Text
          , access_key_id :
              Optional Text
          , secret_access_key :
              Optional Text
          , session_token :
              Optional Text
          , region_name :
              Optional Text
          , private :
              Optional Bool
          , cloudfront_url :
              Optional Text
          , endpoint :
              Optional Text
          , disable_ssl :
              Optional Bool
          , skip_ssl_verification :
              Optional Bool
          , skip_download :
              Optional Bool
          , server_side_encryption :
              Optional Text
          , sse_kms_key_id :
              Optional Text
          , use_v2_signing :
              Optional Bool
          , disable_multipart :
              Optional Bool
          , regexp :
              Optional Text
          , versioned_file :
              Optional Text
          , initial_path :
              Optional Text
          , initial_version :
              Optional Text
          , initial_content_text :
              Optional Text
          , initial_content_binary :
              Optional Text
          }
        : Type
    }
}
