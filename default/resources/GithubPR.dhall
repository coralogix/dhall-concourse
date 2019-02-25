let GithubPR = ../../types/resources/GithubPR.dhall

let ResourceType = ../../types/ResourceType.dhall

let mkResourceType = ../ResourceType.dhall

let name = "pull-request"

let repository = "telioss/github-pr-resource"

in  { version =
          λ(_params : { pr : Text, commit : Text, committed : Optional Text })
        →   { pr =
                _params.pr
            , commit =
                _params.commit
            , committed =
                _params.committed
            }
          : GithubPR.version.schema
    , params =
        { get =
            { skip_download = None Bool } : GithubPR.params.get.schema
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
              : GithubPR.params.put.schema
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
          : GithubPR.source.schema
    , meta =
        { name =
            name
        , repository =
            repository
        , resource_type =
              mkResourceType.DockerImage
              { name = name, repository = repository }
            : ResourceType
        }
    }
