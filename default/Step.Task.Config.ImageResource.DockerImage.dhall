let Version = ../types/Version.dhall : Type

let DockerImage = ../types/resources/DockerImage.dhall

let mkDockerImage = ./resources/DockerImage.dhall

let ImageResource = ../types/Step.Task.Config.ImageResource.dhall

in    λ(_params : { repository : Text })
    →   { type = "docker-image"
        , params = None DockerImage.params.get.schema
        , version = None Version
        , source =
              mkDockerImage.source { repository = _params.repository }
            : DockerImage.source.schema
        }
      : ImageResource.docker-image.schema
