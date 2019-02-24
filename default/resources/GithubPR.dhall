let GithubPR = ../../types/resources/GithubPR.dhall

let ResourceType = ../../types/ResourceType.dhall

let mkResourceType = ../ResourceType.dhall

let name = "pull-request"

in  { params =
        { get =
            { skip_download = None Bool } : GithubPR.get_params
        , put =
              λ(_params : { path : Text })
            →   { path =
                    _params.path
                , status =
                    None Text
                , context =
                    None Text
                , comment =
                    None Text
                , comment_file =
                    None Text
                }
              : GithubPR.put_params
        }
    , source =
          λ(_params : { repository : Text, access_token : Text })
        →   { repository =
                _params.repository
            , access_token =
                _params.access_token
            , v3_endpoint =
                None Text
            , v4_endpoint =
                None Text
            , paths =
                None Text
            , ignore_paths =
                None Text
            , disable_ci_skip =
                None Bool
            , skip_ssl_verification =
                None Bool
            }
          : GithubPR.source
    , meta =
        { name =
            name
        , resource_type =
              mkResourceType.DockerImage
              { name =
                  "pull-request"
              , repository =
                  "telioss/github-pr-resource"
              }
            : ResourceType
        }
    }
