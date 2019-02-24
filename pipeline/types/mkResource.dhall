let Version = ./Version.dhall

let ResourceDefinition = ./ResourceDefinition.dhall

in    λ(definition : ResourceDefinition)
    →   { name :
            Text
        , type :
            Text
        , version :
            Optional (Version definition.version_schema)
        , check_every :
            Optional Text
        , tags :
            Optional (List Text)
        , webhook_token :
            Optional Text
        , source :
            definition.source
        }
      : Type
