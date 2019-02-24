let Helm = ../../types/resources/Helm.dhall

let ResourceType = ../../types/ResourceType.dhall

let mkResourceType = ../ResourceType.dhall

let name = "helm"

in  { params =
        { get =
            {=} : Helm.get_params
        , put =
              λ(_params : { chart : Text })
            →   { chart =
                    _params.chart
                , namespace =
                    None Text
                , release =
                    None Text
                , values =
                    None Helm.put_params_values
                , override_values =
                    None
                    ( List
                      { key :
                          Text
                      , value :
                          Optional Text
                      , path :
                          Optional Text
                      , hide :
                          Optional Bool
                      , type :
                          Optional Text
                      }
                    )
                , token_path =
                    None Text
                , version =
                    None Text
                , delete =
                    None Bool
                , test =
                    None Bool
                , purge =
                    None Bool
                , replace =
                    None Bool
                , force =
                    None Bool
                , devel =
                    None Bool
                , debug =
                    None Bool
                , wait_until_ready =
                    None Natural
                , recreate_pods =
                    None Bool
                , show_diff =
                    None Bool
                , exit_after_diff =
                    None Bool
                , reuse_values =
                    None Bool
                }
              : Helm.put_params
        }
    , source =
          λ(_params : { cluster_url : Text })
        →   { cluster_url =
                _params.cluster_url
            , cluster_ca =
                None Text
            , token =
                None Text
            , admin_key =
                None Text
            , admin_cert =
                None Text
            , release =
                None Text
            , namespace =
                None Text
            , helm_init_server =
                None Bool
            , helm_history_max =
                None Natural
            , tiller_namespace =
                None Text
            , tiller_service_account =
                None Text
            , repos =
                None
                ( List
                  { name :
                      Text
                  , url :
                      Text
                  , username :
                      Optional Text
                  , password :
                      Optional Text
                  }
                )
            , helm_host =
                None Text
            , tls_enabled =
                None Bool
            , helm_ca =
                None Text
            , helm_cert =
                None Text
            , helm_key =
                None Text
            , tiller_cert =
                None Text
            , tiller_key =
                None Text
            }
          : Helm.source
    , meta =
        { name =
            name
        , resource_type =
              mkResourceType.DockerImage
              { name = name, repository = "linkyard/concourse-helm-resource" }
            : ResourceType
        }
    }
