let Helm = ../../types/resources/Helm.dhall

let ResourceType = ../../types/ResourceType.dhall

let mkResourceType = ../ResourceType.dhall

let name = "helm"

let repository = "linkyard/concourse-helm-resource"

in  { version =
          λ(_params : { revision : Text, release : Text })
        →   { revision = _params.revision, release = _params.release }
          : Helm.version.schema
    , params =
        { get = {=} : Helm.params.get.schema
        , put =
              λ(_params : { chart : Text })
            →   { chart = _params.chart
                , namespace = None Text
                , release = None Text
                , values = None Helm.params.put.values.schema
                , override_values =
                    None
                      ( List
                          { key : Text
                          , value : Optional Text
                          , path : Optional Text
                          , hide : Optional Bool
                          , type : Optional Text
                          }
                      )
                , token_path = None Text
                , version = None Text
                , delete = None Bool
                , test = None Bool
                , purge = None Bool
                , replace = None Bool
                , force = None Bool
                , devel = None Bool
                , debug = None Bool
                , wait_until_ready = None Natural
                , recreate_pods = None Bool
                , show_diff = None Bool
                , exit_after_diff = None Bool
                , reuse_values = None Bool
                }
              : Helm.params.put.schema
        }
    , source =
          λ(_params : { cluster_url : Text })
        →   { cluster_url = _params.cluster_url
            , cluster_ca = None Text
            , token = None Text
            , admin_key = None Text
            , admin_cert = None Text
            , release = None Text
            , namespace = None Text
            , helm_init_server = None Bool
            , helm_history_max = None Natural
            , tiller_namespace = None Text
            , tiller_service_account = None Text
            , repos =
                None
                  ( List
                      { name : Text
                      , url : Text
                      , username : Optional Text
                      , password : Optional Text
                      }
                  )
            , helm_host = None Text
            , tls_enabled = None Bool
            , helm_ca = None Text
            , helm_cert = None Text
            , helm_key = None Text
            , tiller_cert = None Text
            , tiller_key = None Text
            }
          : Helm.source.schema
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
