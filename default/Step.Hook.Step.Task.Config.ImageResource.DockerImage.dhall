let Version = ../types/Version.dhall : Type

let DockerImage = ../types/resources/DockerImage.dhall

let mkDockerImage = ./resources/DockerImage.dhall

let ImageResource = ../types/Step.Hook.Step.Task.Config.ImageResource.dhall

in    λ(_params : { repository : Text })
    →   { type = mkDockerImage.meta.name
        , params = None DockerImage.params.get.schema
        , version = None Version
        , source =
              mkDockerImage.source { repository = _params.repository }
            : DockerImage.source.schema
        }
      : ImageResource.docker-image.schema
