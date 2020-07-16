let DockerImage = ../../types/resources/DockerImage.dhall

let name = "docker-image"

in  { version =
          λ(_params : { digest : Text })
        → { digest = _params.digest } : DockerImage.version.schema
    , params =
        { get =
              { save =
                  None Text
              , rootfs =
                  None Text
              , skip_download =
                  None Bool
              }
            : DockerImage.params.get.schema
        , put =
              { additional_tags =
                  None Text
              , build =
                  None Text
              , build_args =
                  None (List { mapKey : Text, mapValue : Text })
              , build_args_file =
                  None Text
              , cache =
                  None Bool
              , cache_from =
                  None (List Text)
              , cache_tag =
                  None Text
              , dockerfile =
                  None Text
              , import_file =
                  None Text
              , labels =
                  None (List { mapKey : Text, mapValue : Text })
              , labels_file =
                  None Text
              , load =
                  None Text
              , load_base =
                  None Text
              , load_bases =
                  None (List Text)
              , load_file =
                  None Text
              , load_repository =
                  None Text
              , load_tag =
                  None Text
              , tag_file =
                  None Text
              , tag_as_latest =
                  None Bool
              , tag_prefix =
                  None Text
              , target_name =
                  None Text
              }
            : DockerImage.params.put.schema
        }
    , source =
          λ(_params : { repository : Text })
        →   { repository =
                _params.repository
            , tag =
                None Text
            , username =
                None Text
            , password =
                None Text
            , aws_access_key_id =
                None Text
            , aws_secret_access_key =
                None Text
            , aws_session_token =
                None Text
            , insecure_registries =
                None (List Text)
            , registry_mirror =
                None Text
            , ca_certs =
                None (List { domain : Text, cert : Text })
            , client_certs =
                None (List { domain : Text, cert : Text, key : Text })
            , max_concurrent_downloads =
                None Natural
            , max_concurrent_uploads =
                None Natural
            }
          : DockerImage.source.schema
    , meta =
        { name = name }
    }
