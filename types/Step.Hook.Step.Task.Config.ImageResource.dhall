let Version = ./Version.dhall : Type

let DockerImage = ./resources/DockerImage.dhall

in    { type :
          Text
      , params :
          Optional DockerImage.params.get.schema
      , version :
          Optional Version
      , source :
          DockerImage.source.schema
      }
    : Type
