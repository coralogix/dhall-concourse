let ResourceType = ../types/ResourceType.dhall

let mkDockerImage = ./resources/DockerImage.dhall

let mkRegistryImage = ./resources/RegistryImage.dhall

in  { DockerImage =
          λ(_params : { name : Text, repository : Text })
        →   { name = _params.name
            , type = mkDockerImage.meta.name
            , privileged = None Bool
            , check_every = None Text
            , tags = None (List Text)
            , source = mkDockerImage.source { repository = _params.repository }
            , params = None (List { mapKey : Text, mapValue : Text })
            }
          : ResourceType.docker-image.schema
    , RegistryImage =
          λ(_params : { name : Text, repository : Text })
        →   { name = _params.name
            , type = mkRegistryImage.meta.name
            , privileged = None Bool
            , check_every = None Text
            , tags = None (List Text)
            , source =
                mkRegistryImage.source { repository = _params.repository }
            , params = None (List { mapKey : Text, mapValue : Text })
            }
          : ResourceType.registry-image.schema
    }
