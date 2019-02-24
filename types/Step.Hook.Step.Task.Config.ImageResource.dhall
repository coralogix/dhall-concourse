let Version = ./Version.dhall : Type

let DockerImage = ./resources/DockerImage.dhall

in    { type :
          Text
      , params :
          Optional DockerImage.get_params
      , version :
          Optional Version
      , source :
          DockerImage.source
      }
    : Type
