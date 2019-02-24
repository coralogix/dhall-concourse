{ version_schema =
    { pr : Text, commit : Text, committed : Optional Text }
, get_params =
    { skip_download : Optional Bool } : Type
, put_params =
      { path :
          Text
      , status :
          Optional Text
      , context :
          Optional Text
      , comment :
          Optional Text
      , comment_file :
          Optional Text
      }
    : Type
, source =
      { repository :
          Text
      , access_token :
          Text
      , v3_endpoint :
          Optional Text
      , v4_endpoint :
          Optional Text
      , paths :
          Optional Text
      , ignore_paths :
          Optional Text
      , disable_ci_skip :
          Optional Bool
      , skip_ssl_verification :
          Optional Bool
      }
    : Type
}
