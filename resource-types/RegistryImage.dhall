{ meta =
  { name = "registry-image", repository = "concourse/registry-image-resource" }
, Version = { Type = { digest : Text }, default = {=} }
, Params =
  { Get =
      let Get =
            { Type = { format : Optional Text, skip_download : Optional Bool }
            , default = { format = None Text, skip_download = None Bool }
            }

      let test = Get::{=}

      in  Get
  , Put =
      let Put =
            { Type = { image : Text, additional_tags : Optional Text }
            , default.additional_tags = None Text
            }

      let test = Put::{ image = "test" }

      in  Put
  }
, Source =
    let Source =
          let RegistryMirror =
                let RegistryMirror =
                      { Type =
                          { host : Text
                          , username : Optional Text
                          , password : Optional Text
                          }
                      , default = { username = None Text, password = None Text }
                      }

                let test = RegistryMirror::{ host = "test" }

                in  RegistryMirror

          let ContentTrust =
                let ContentTrust =
                      { Type =
                          { server : Optional Text
                          , repository_key_id : Text
                          , repository_key : Text
                          , repository_passphrase : Text
                          , tls_key : Optional Text
                          , tls_cert : Optional Text
                          }
                      , default =
                        { server = None Text
                        , tls_key = None Text
                        , tls_cert = None Text
                        }
                      }

                let test =
                      ContentTrust::{
                      , repository_key_id = "test"
                      , repository_key = "test"
                      , repository_passphrase = "test"
                      }

                in  ContentTrust

          in  { Type =
                  { repository : Text
                  , tag : Optional Text
                  , username : Optional Text
                  , password : Optional Text
                  , aws_access_key_id : Optional Text
                  , aws_secret_access_key : Optional Text
                  , aws_session_token : Optional Text
                  , aws_region : Optional Text
                  , aws_role_arn : Optional Text
                  , debug : Optional Bool
                  , registry_mirror : Optional RegistryMirror.Type
                  , content_trust : Optional ContentTrust.Type
                  }
              , default =
                { tag = None Text
                , username = None Text
                , password = None Text
                , aws_access_key_id = None Text
                , aws_secret_access_key = None Text
                , aws_session_token = None Text
                , aws_region = None Text
                , aws_role_arn = None Text
                , debug = None Bool
                , registry_mirror = None RegistryMirror.Type
                , content_trust = None ContentTrust.Type
                }
              , RegistryMirror
              , ContentTrust
              }

    let test = Source::{ repository = "test" }

    in  Source
}
