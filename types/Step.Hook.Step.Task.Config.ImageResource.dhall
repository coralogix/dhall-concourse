let Version = ./Version.dhall : Type

let DockerImage = ./resources/DockerImage.dhall

let RegistryImage = ./resources/RegistryImage.dhall

let dockerImageSchema =
      { type : Text
      , params : Optional DockerImage.params.get.schema
      , version : Optional Version
      , source : DockerImage.source.schema
      }

let registryImageSchema =
      { type : Text
      , params : Optional RegistryImage.params.get.schema
      , version : Optional Version
      , source : RegistryImage.source.schema
      }

in  { schema =
        < DockerImage : dockerImageSchema : Type
        | RegistryImage : registryImageSchema : Type
        >
    , docker-image = { schema = dockerImageSchema }
    , registry-image = { schema = registryImageSchema }
    }
