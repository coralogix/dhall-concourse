let ConcoursePipeline = ../../types/resources/ConcoursePipeline.dhall

let ResourceType = ../../types/ResourceType.dhall

let mkResourceType = ../ResourceType.dhall

let name = "concourse-pipeline"

in  { params =
        { get =
            {=} : ConcoursePipeline.get_params
        , put =
            { dynamic =
                  λ(_params : { pipelines_file : Text })
                →   { pipelines_file = _params.pipelines_file }
                  : ConcoursePipeline.put_params_dynamic
            , static =
                  λ ( _params
                    : { pipelines :
                          List ConcoursePipeline.put_params_static_pipeline
                      }
                    )
                →   { pipelines = _params.pipelines }
                  : ConcoursePipeline.put_params_static
            , static_pipeline =
                  λ(_params : { name : Text, team : Text, config_file : Text })
                →   { name =
                        _params.name
                    , team =
                        _params.team
                    , config_file =
                        _params.config_file
                    , vars_files =
                        None (List Text)
                    , unpaused =
                        None Bool
                    }
                  : ConcoursePipeline.put_params_static_pipeline
            }
        }
    , source =
          λ(_params : { teams : List ConcoursePipeline.source_team })
        →   { target = None Text, insecure = None Bool, teams = _params.teams }
          : ConcoursePipeline.source
    , source_team =
          λ(_params : { name : Text })
        →   { name = _params.name, username = None Text, password = None Text }
          : ConcoursePipeline.source_team
    , meta =
        { name =
            name
        , resource_type =
              mkResourceType.DockerImage
              { name =
                  name
              , repository =
                  "concourse/concourse-pipeline-resource"
              }
            : ResourceType
        }
    }
