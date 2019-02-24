{ version_schema =
    { digest : Text }
, get_params =
      { save :
          Optional Text
      , rootfs :
          Optional Text
      , skip_download :
          Optional Bool
      }
    : Type
, put_params =
      { additional_tags :
          Optional Text
      , build :
          Optional Text
      , build_args :
          Optional (List { mapKey : Text, mapValue : Text })
      , build_args_file :
          Optional Text
      , cache :
          Optional Bool
      , cache_from :
          Optional (List Text)
      , cache_tag :
          Optional Text
      , dockerfile :
          Optional Text
      , import_file :
          Optional Text
      , labels :
          Optional (List { mapKey : Text, mapValue : Text })
      , labels_file :
          Optional Text
      , load :
          Optional Text
      , load_base :
          Optional Text
      , load_bases :
          Optional (List Text)
      , load_file :
          Optional Text
      , load_repository :
          Optional Text
      , load_tag :
          Optional Text
      , tag_file :
          Optional Text
      , tag_as_latest :
          Optional Bool
      , tag_prefix :
          Optional Text
      , target_name :
          Optional Text
      }
    : Type
, source =
      { repository :
          Text
      , tag :
          Optional Text
      , username :
          Optional Text
      , password :
          Optional Text
      , aws_access_key_id :
          Optional Text
      , aws_secret_access_key :
          Optional Text
      , aws_session_token :
          Optional Text
      , insecure_registries :
          Optional (List Text)
      , registry_mirror :
          Optional Text
      , ca_certs :
          Optional (List { domain : Text, cert : Text })
      , client_certs :
          Optional (List { domain : Text, cert : Text, key : Text })
      , max_concurrent_downloads :
          Optional Natural
      , max_concurrent_uploads :
          Optional Natural
      }
    : Type
}
