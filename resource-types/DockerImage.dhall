{ meta =
  { name = "docker-image", repository = "concourse/docker-image-resource" }
, Version = { Type = { digest : Text }, default = {=} }
, Params =
  { Get =
      let Get =
            { Type =
                { save : Optional Text
                , rootfs : Optional Text
                , skip_download : Optional Bool
                }
            , default =
              { save = None Text
              , rootfs = None Text
              , skip_download = None Bool
              }
            }

      let test = Get::{=}

      in  Get
  , Put =
      let Put =
            { Type =
                { additional_tags : Optional Text
                , build : Optional Text
                , build_args :
                    Optional (List { mapKey : Text, mapValue : Text })
                , build_args_file : Optional Text
                , cache : Optional Bool
                , cache_from : Optional (List Text)
                , cache_tag : Optional Text
                , dockerfile : Optional Text
                , import_file : Optional Text
                , labels : Optional (List { mapKey : Text, mapValue : Text })
                , labels_file : Optional Text
                , load : Optional Text
                , load_base : Optional Text
                , load_bases : Optional (List Text)
                , load_file : Optional Text
                , load_repository : Optional Text
                , load_tag : Optional Text
                , tag_file : Optional Text
                , tag_as_latest : Optional Bool
                , tag_prefix : Optional Text
                , target_name : Optional Text
                }
            , default =
              { additional_tags = None Text
              , build = None Text
              , build_args = None (List { mapKey : Text, mapValue : Text })
              , build_args_file = None Text
              , cache = None Bool
              , cache_from = None (List Text)
              , cache_tag = None Text
              , dockerfile = None Text
              , import_file = None Text
              , labels = None (List { mapKey : Text, mapValue : Text })
              , labels_file = None Text
              , load = None Text
              , load_base = None Text
              , load_bases = None (List Text)
              , load_file = None Text
              , load_repository = None Text
              , load_tag = None Text
              , tag_file = None Text
              , tag_as_latest = None Bool
              , tag_prefix = None Text
              , target_name = None Text
              }
            }

      let test = Put::{=}

      in  Put
  }
, Source =
    let Source =
          let CaCert = { Type = { domain : Text, cert : Text }, default = {=} }

          let ClientCert =
                { Type = { domain : Text, cert : Text, key : Text }
                , default = {=}
                }

          in  { Type =
                  { repository : Text
                  , tag : Optional Text
                  , username : Optional Text
                  , password : Optional Text
                  , aws_access_key_id : Optional Text
                  , aws_secret_access_key : Optional Text
                  , aws_session_token : Optional Text
                  , insecure_registries : Optional (List Text)
                  , registry_mirror : Optional Text
                  , ca_certs : Optional (List CaCert.Type)
                  , client_certs : Optional (List ClientCert.Type)
                  , max_concurrent_downloads : Optional Natural
                  , max_concurrent_uploads : Optional Natural
                  }
              , default =
                { tag = None Text
                , username = None Text
                , password = None Text
                , aws_access_key_id = None Text
                , aws_secret_access_key = None Text
                , aws_session_token = None Text
                , insecure_registries = None (List Text)
                , registry_mirror = None Text
                , ca_certs = None (List CaCert.Type)
                , client_certs = None (List ClientCert.Type)
                , max_concurrent_downloads = None Natural
                , max_concurrent_uploads = None Natural
                }
              , CaCert
              , ClientCert
              }

    let test = Source::{ repository = "test" }

    in  Source
}
