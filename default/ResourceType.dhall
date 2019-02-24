let ResourceType = ../types/ResourceType.dhall : Type

let Source = ../types/resources/_resource_type_sources.dhall

let DockerImage = ../types/resources/DockerImage.dhall

in  { DockerImage =
          λ(_params : { name : Text, repository : Text })
        →   { name =
                _params.name
            , type =
                "docker-image"
            , privileged =
                None Bool
            , check_every =
                None Text
            , tags =
                None (List Text)
            , source =
                Source.DockerImage
                (   { repository =
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
                  : DockerImage.source
                )
            , params =
                None (List { mapKey : Text, mapValue : Text })
            }
          : ResourceType
    }
