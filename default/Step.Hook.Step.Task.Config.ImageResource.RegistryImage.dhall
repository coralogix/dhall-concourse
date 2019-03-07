let Version = ../types/Version.dhall : Type

let RegistryImage = ../types/resources/RegistryImage.dhall

let mkRegistryImage = ./resources/RegistryImage.dhall

let ImageResource = ../types/Step.Hook.Step.Task.Config.ImageResource.dhall

in    λ(_params : { type : Text, repository : Text })
    →   { type =
            _params.type
        , params =
            None RegistryImage.params.get.schema
        , version =
            None Version
        , source =
              mkRegistryImage.source { repository = _params.repository }
            : RegistryImage.source.schema
        }
      : ImageResource.registry-image.schema
