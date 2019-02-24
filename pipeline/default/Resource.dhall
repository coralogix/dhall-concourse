let Version = ../types/Version.dhall : Type → Type

let ResourceDefinition = ../types/ResourceDefinition.dhall : Kind

let Resource = ../types/Resource.dhall : ResourceDefinition → Type

in    λ(resourceDefinition : ResourceDefinition)
    → λ(_params : { name : Text, resource : resourceDefinition.default })
    →   { name =
            _params.name
        , type =
            _params.resource.type
        , version =
            None (Version resourceDefinition.version_schema)
        , check_every =
            None Text
        , tags =
            None (List Text)
        , webhook_token =
            None Text
        , source =
            _params.resource.source
        }
      : Resource resourceDefinition
