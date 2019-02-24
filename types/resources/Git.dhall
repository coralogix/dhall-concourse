{ version_schema =
    { ref : Text }
, get_params =
    let SubmodulesType = < Generic : Text | ListSpecific : List Text >
    
    in    { depth :
              Optional Natural
          , submodules :
              Optional SubmodulesType
          , submodule_recursive :
              Optional Bool
          , submodule_remote :
              Optional Bool
          , disable_git_lfs :
              Optional Bool
          , clean_tags :
              Optional Bool
          , short_ref_format :
              Optional Text
          }
        : Type
, put_params =
      { repository :
          Text
      , rebase :
          Optional Bool
      , `merge` :
          Optional Bool
      , tag :
          Optional Text
      , only_tag :
          Optional Bool
      , tag_prefix :
          Optional Text
      , force :
          Optional Bool
      , annotate :
          Optional Text
      , notes :
          Optional Text
      }
    : Type
, source =
      { uri :
          Text
      , branch :
          Text
      , private_key :
          Optional Text
      , username :
          Optional Text
      , password :
          Optional Text
      , paths :
          Optional (List Text)
      , ignore_paths :
          Optional (List Text)
      , skip_ssl_verification :
          Optional Bool
      , tag_filter :
          Optional Text
      , git_config :
          Optional (List { mapKey : Text, mapValue : Text })
      , disable_ci_skip :
          Optional Bool
      , commit_verification_keys :
          Optional (List Text)
      , commit_verification_key_ids :
          Optional (List Text)
      , gpg_keyserver :
          Optional Text
      , git_crypt_key :
          Optional Text
      , https_tunnel :
          Optional
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
    : Type
}
