let ResourceType = ../types/ResourceType.dhall : Type

let Source = (../types/resources/_unions.dhall).source.resource_type

let DockerImage = ../types/resources/DockerImage.dhall

let mkDockerImage = ./resources/DockerImage.dhall

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
                (mkDockerImage.source { repository = _params.repository })
            , params =
                None (List { mapKey : Text, mapValue : Text })
            }
          : ResourceType
    }
