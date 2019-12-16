let ChartMuseum = ../../types/resources/ChartMuseum.dhall

let ResourceType = ../../types/ResourceType.dhall

let mkResourceType = ../ResourceType.dhall

let name = "chartmuseum"

let repository = "cathive/concourse-chartmuseum-resource"

in  { version =
          λ(_params : { version : Text, digest : Text })
        →   { version = _params.version, digest = _params.digest }
          : ChartMuseum.version.schema
    , params =
        { get = { target_basename = None Text } : ChartMuseum.params.get.schema
        , put =
              λ(_params : { chart : Text })
            →   { chart = _params.chart
                , force = None Bool
                , version = None Text
                , version_file = None Text
                , sign = None Bool
                , key_data = None Text
                , key_file = None Text
                , key_passphrase = None Text
                }
              : ChartMuseum.params.put.schema
        }
    , source =
          λ(_params : { server_url : Text, chart_name : Text })
        →   { server_url = _params.server_url
            , chart_name = _params.chart_name
            , version_range = None Text
            , basic_auth_username = None Text
            , basic_auth_password = None Text
            }
          : ChartMuseum.source.schema
    , meta =
        { name = name
        , repository = repository
        , resource_type =
            { docker =
                ResourceType.schema.DockerImage
                  ( mkResourceType.DockerImage
                      { name = name, repository = repository }
                  )
            , registry =
                ResourceType.schema.RegistryImage
                  ( mkResourceType.RegistryImage
                      { name = name, repository = repository }
                  )
            }
        }
    }
