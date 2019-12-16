let RegistryImage = ../../types/resources/RegistryImage.dhall

let name = "registry-image"

in  { version =
          λ(_params : { digest : Text })
        → { digest = _params.digest } : RegistryImage.version.schema
    , params =
        { get = { format = None Text } : RegistryImage.params.get.schema
        , put =
              λ(_params : { image : Text })
            →   { image = _params.image, additional_tags = None Text }
              : RegistryImage.params.put.schema
        }
    , source =
          λ(_params : { repository : Text })
        →   { repository = _params.repository
            , tag = None Text
            , username = None Text
            , password = None Text
            , debug = None Bool
            }
          : RegistryImage.source.schema
    , meta = { name = name }
    }
