let Version = ../types/Version.dhall : Type

let DockerImage = ../types/resources/DockerImage.dhall

let ImageResource = ../types/Step.Task.Config.ImageResource.dhall : Type

in    λ(_params : { type : Text, repository : Text })
    →   { type =
            _params.type
        , params =
            None DockerImage.get_params
        , version =
            None Version
        , source =
              { repository =
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
        }
      : ImageResource
