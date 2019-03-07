let ConcoursePipeline = ../../types/resources/ConcoursePipeline.dhall

let ResourceType = ../../types/ResourceType.dhall

let mkResourceType = ../ResourceType.dhall

let name = "concourse-pipeline"

let repository = "concourse/concourse-pipeline-resource"

in  { version =
          λ(_params : { mapKey : Text, mapValue : Text })
        →   { mapKey = _params.mapKey, mapValue = _params.mapValue }
          : ConcoursePipeline.version.schema
    , params =
        { get =
            {=} : ConcoursePipeline.params.get.schema
        , put =
            { dynamic =
                  λ(_params : { pipelines_file : Text })
                →   { pipelines_file = _params.pipelines_file }
                  : ConcoursePipeline.params.put.dynamic.schema
            , static =
                  λ ( _params
                    : { pipelines :
                          List
                          ConcoursePipeline.params.put.static.pipeline.schema
                      }
                    )
                →   { pipelines = _params.pipelines }
                  : ConcoursePipeline.params.put.static.schema
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
                  : ConcoursePipeline.params.put.static.pipeline.schema
            }
        }
    , source =
          λ(_params : { teams : List ConcoursePipeline.source.team.schema })
        →   { target = None Text, insecure = None Bool, teams = _params.teams }
          : ConcoursePipeline.source.schema
    , source_team =
          λ(_params : { name : Text })
        →   { name = _params.name, username = None Text, password = None Text }
          : ConcoursePipeline.source.team.schema
    , meta =
        { name =
            name
        , repository =
            repository
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
