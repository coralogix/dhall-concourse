let DockerImageSource = (./resources/DockerImage.dhall).source.schema

let RegistryImageSource = (./resources/RegistryImage.dhall).source.schema

let DockerImage =
      { name :
          Text
      , type :
          Text
      , privileged :
          Optional Bool
      , check_every :
          Optional Text
      , tags :
          Optional (List Text)
      , source :
          DockerImageSource
      , params :
          Optional (List { mapKey : Text, mapValue : Text })
      }

let RegistryImage =
      { name :
          Text
      , type :
          Text
      , privileged :
          Optional Bool
      , check_every :
          Optional Text
      , tags :
          Optional (List Text)
      , source :
          RegistryImageSource
      , params :
          Optional (List { mapKey : Text, mapValue : Text })
      }

in  { schema =
        < DockerImage : DockerImage | RegistryImage : RegistryImage >
    , docker-image =
        { schema = DockerImage }
    , registry-image =
        { schema = RegistryImage }
    }
