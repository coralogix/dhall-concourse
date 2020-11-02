{ meta = { name = "helm3", repository = "typositoire/concourse-helm3-resource" }
, Version = { Type = { revision : Text, release : Text }, default = {=} }
, Params =
  { Get = let not-supported = { Type = {}, default = {=} } in not-supported
  , Put =
      let Values = < Text : Text | Array : List Text >

      let OverrideValue =
            let Common =
                  { Type =
                      { key : Text
                      , hide : Optional Bool
                      , type : Optional Text
                      , verbatim : Optional Bool
                      }
                  , default =
                    { hide = None Bool, type = None Text, verbatim = None Bool }
                  }

            let Options =
                  { Path =
                    { Type = Common.Type ⩓ { path : Text }
                    , default = Common.default
                    }
                  , Value =
                      let Untyped =
                            < String : Text | Number : Natural | Bool : Bool >

                      in  { Type = Common.Type ⩓ { value : Untyped }
                          , default = Common.default
                          , Untyped
                          }
                  }

            let _Type =
                  < Path : Options.Path.Type | Value : Options.Value.Type >

            in  { Type = _Type
                , Path = λ(path : Options.Path.Type) → _Type.Path path
                , Value = λ(value : Options.Value.Type) → _Type.Value value
                , Options
                }

      let Put =
            { Type =
                { chart : Text
                , namespace : Optional Text
                , create_namespace : Optional Bool
                , release : Optional Text
                , values : Optional Values
                , override_values : Optional (List OverrideValue.Type)
                , token_path : Optional Text
                , version : Optional Text
                , test : Optional Bool
                , test_logs : Optional Bool
                , delete : Optional Bool
                , replace : Optional Bool
                , force : Optional Bool
                , devel : Optional Bool
                , debug : Optional Bool
                , check_is_ready : Optional Bool
                , atomic : Optional Bool
                , reuse_values : Optional Bool
                , timeout : Optional Text
                , wait : Optional Natural
                , kubeconfig_path : Optional Text
                , show_diff : Optional Bool
                }
            , default =
              { namespace = None Text
              , create_namespace = None Bool
              , release = None Text
              , values = None Values
              , override_values = None (List OverrideValue.Type)
              , token_path = None Text
              , version = None Text
              , test = None Bool
              , test_logs = None Bool
              , delete = None Bool
              , replace = None Bool
              , force = None Bool
              , devel = None Bool
              , debug = None Bool
              , check_is_ready = None Bool
              , atomic = None Bool
              , reuse_values = None Bool
              , timeout = None Text
              , wait = None Natural
              , kubeconfig_path = None Text
              , show_diff = None Bool
              }
            }

      let test = Put::{ chart = "test" }

      in  Put
  }
, Source =
    let Plugin =
          { Type = { url : Text, version : Optional Text }
          , default.version = None Text
          }

    let Repository =
          { Type =
              { name : Text
              , url : Text
              , username : Optional Text
              , password : Optional Text
              }
          , default = { username = None Text, password = None Text }
          }

    let Source =
          { Type =
              { cluster_url : Optional Text
              , cluster_ca : Optional Text
              , insecure_cluster : Optional Bool
              , token : Optional Text
              , token_path : Optional Text
              , admin_key : Optional Text
              , admin_cert : Optional Text
              , release : Optional Text
              , namespace : Optional Text
              , helm_history_max : Optional Natural
              , repos : Optional (List Repository.Type)
              , plugins : Optional (List Plugin.Type)
              , stable_repo : Optional Text
              , tracing_enabled : Optional Bool
              , helm_setup_purge_all : Optional Bool
              }
          , default =
            { cluster_url = None Text
            , cluster_ca = None Text
            , insecure_cluster = None Bool
            , token = None Text
            , token_path = None Text
            , admin_key = None Text
            , admin_cert = None Text
            , release = None Text
            , namespace = None Text
            , helm_history_max = None Natural
            , repos = None (List Repository.Type)
            , plugins = None (List Plugin.Type)
            , stable_repo = None Text
            , tracing_enabled = None Bool
            , helm_setup_purge_all = None Bool
            }
          , Plugin
          , Repository
          }

    let test = Source::{=}

    in  Source
}
