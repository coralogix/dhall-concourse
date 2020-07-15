let Values = < FileName : Text | FileArray : List Text > : Type

in  { version =
        { schema = { revision : Text, release : Text } : Type }
    , params =
        { get =
            { schema = {} : Type }
        , put =
            { schema =
                  { chart :
                      Text
                  , namespace :
                      Optional Text
                  , release :
                      Optional Text
                  , values :
                      Optional Values
                  , override_values :
                      Optional
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
                  , token_path :
                      Optional Text
                  , version :
                      Optional Text
                  , delete :
                      Optional Bool
                  , test :
                      Optional Bool
                  , purge :
                      Optional Bool
                  , replace :
                      Optional Bool
                  , force :
                      Optional Bool
                  , devel :
                      Optional Bool
                  , debug :
                      Optional Bool
                  , wait_until_ready :
                      Optional Natural
                  , recreate_pods :
                      Optional Bool
                  , show_diff :
                      Optional Bool
                  , exit_after_diff :
                      Optional Bool
                  , reuse_values :
                      Optional Bool
                  }
                : Type
            , values =
                { schema = Values }
            }
        }
    , source =
        { schema =
              { cluster_url :
                  Text
              , cluster_ca :
                  Optional Text
              , token :
                  Optional Text
              , admin_key :
                  Optional Text
              , admin_cert :
                  Optional Text
              , release :
                  Optional Text
              , namespace :
                  Optional Text
              , helm_init_server :
                  Optional Bool
              , helm_history_max :
                  Optional Natural
              , tiller_namespace :
                  Optional Text
              , tiller_service_account :
                  Optional Text
              , repos :
                  Optional
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
              , helm_host :
                  Optional Text
              , tls_enabled :
                  Optional Bool
              , helm_ca :
                  Optional Text
              , helm_cert :
                  Optional Text
              , helm_key :
                  Optional Text
              , tiller_cert :
                  Optional Text
              , tiller_key :
                  Optional Text
              }
            : Type
        }
    }
