let ChartMuseum = ../../types/resources/ChartMuseum.dhall

let ResourceType = ../../types/ResourceType.dhall

let mkResourceType = ../ResourceType.dhall

let name = "chartmuseum"

in  { params =
        { get =
            { target_basename = None Text } : ChartMuseum.get_params
        , put =
              λ(_params : { chart : Text })
            →   { chart =
                    _params.chart
                , force =
                    None Bool
                , version =
                    None Text
                , version_file =
                    None Text
                , sign =
                    None Bool
                , key_data =
                    None Text
                , key_file =
                    None Text
                , key_passphrase =
                    None Text
                }
              : ChartMuseum.put_params
        }
    , source =
          λ(_params : { server_url : Text, chart_name : Text })
        →   { server_url =
                _params.server_url
            , chart_name =
                _params.chart_name
            , version_range =
                None Text
            , basic_auth_username =
                None Text
            , basic_auth_password =
                None Text
            }
          : ChartMuseum.source
    , meta =
        { name =
            name
        , resource_type =
              mkResourceType.DockerImage
              { name =
                  name
              , repository =
                  "cathive/concourse-chartmuseum-resource"
              }
            : ResourceType
        }
    }
