{ meta = { name = "s3", repository = "concourse/s3-resource" }
, Version =
    let Options =
          let VersionID = { version_id : Text }

          let Path = { path : Text }

          in  { VersionID, Path }

    let Version = < VersionID : Options.VersionID | Path : Options.Path >

    in  { Type = Version
        , VersionID =
            λ(version_id : Options.VersionID) → Version.VersionID version_id
        , Path = λ(path : Options.Path) → Version.Path path
        , Options
        }
, Params =
  { Get =
      let Get =
            { Type =
                { skip_download : Optional Bool
                , unpack : Optional Bool
                , download_tags : Optional Bool
                }
            , default =
              { skip_download = None Bool
              , unpack = None Bool
              , download_tags = None Bool
              }
            }

      let test = Get::{=}

      in  Get
  , Put =
      let Put =
            { Type =
                { file : Text
                , acl : Optional Text
                , content_type : Optional Text
                }
            , default = { acl = None Text, content_type = None Text }
            }

      let test = Put::{ file = "test" }

      in  Put
  }
, Source =
    let Source =
          { Type =
              { bucket : Text
              , access_key_id : Optional Text
              , secret_access_key : Optional Text
              , session_token : Optional Text
              , region_name : Optional Text
              , private : Optional Bool
              , cloudfront_url : Optional Text
              , endpoint : Optional Text
              , disable_ssl : Optional Bool
              , skip_ssl_verification : Optional Bool
              , skip_download : Optional Bool
              , server_side_encryption : Optional Text
              , sse_kms_key_id : Optional Text
              , use_v2_signing : Optional Bool
              , disable_multipart : Optional Bool
              , regexp : Optional Text
              , versioned_file : Optional Text
              , initial_path : Optional Text
              , initial_version : Optional Text
              , initial_content_text : Optional Text
              , initial_content_binary : Optional Text
              }
          , default =
            { bucket = Text
            , access_key_id = None Text
            , secret_access_key = None Text
            , session_token = None Text
            , region_name = None Text
            , private = None Bool
            , cloudfront_url = None Text
            , endpoint = None Text
            , disable_ssl = None Bool
            , skip_ssl_verification = None Bool
            , skip_download = None Bool
            , server_side_encryption = None Text
            , sse_kms_key_id = None Text
            , use_v2_signing = None Bool
            , disable_multipart = None Bool
            , regexp = None Text
            , versioned_file = None Text
            , initial_path = None Text
            , initial_version = None Text
            , initial_content_text = None Text
            , initial_content_binary = None Text
            }
          }

    let test = Source::{ bucket = "test" }

    in  Source
}
