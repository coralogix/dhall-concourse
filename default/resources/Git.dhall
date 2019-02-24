let Git = ../../types/resources/Git.dhall

let name = "git"

in  { params =
        { get =
              { depth =
                  None Natural
              , submodules =
                  None < Generic : Text | ListSpecific : List Text >
              , submodule_recursive =
                  None Bool
              , submodule_remote =
                  None Bool
              , disable_git_lfs =
                  None Bool
              , clean_tags =
                  None Bool
              , short_ref_format =
                  None Text
              }
            : Git.get_params
        , put =
              λ(_params : { repository : Text })
            →   { repository =
                    _params.repository
                , rebase =
                    None Bool
                , `merge` =
                    None Bool
                , tag =
                    None Text
                , only_tag =
                    None Bool
                , tag_prefix =
                    None Text
                , force =
                    None Bool
                , annotate =
                    None Text
                , notes =
                    None Text
                }
              : Git.put_params
        }
    , source =
          λ(_params : { uri : Text, branch : Text })
        →   { uri =
                _params.uri
            , branch =
                _params.branch
            , private_key =
                None Text
            , username =
                None Text
            , password =
                None Text
            , paths =
                None (List Text)
            , ignore_paths =
                None (List Text)
            , skip_ssl_verification =
                None Bool
            , tag_filter =
                None Text
            , git_config =
                None (List { mapKey : Text, mapValue : Text })
            , disable_ci_skip =
                None Bool
            , commit_verification_keys =
                None (List Text)
            , commit_verification_key_ids =
                None (List Text)
            , gpg_keyserver =
                None Text
            , git_crypt_key =
                None Text
            , https_tunnel =
                None
                { proxy_host :
                    Text
                , proxy_port :
                    Text
                , proxy_user :
                    Optional Text
                , proxy_password :
                    Optional Text
                }
            }
          : Git.source
    , meta =
        { name = name }
    }
