let GithubListRepos = ../../types/resources/GithubListRepos.dhall

let ResourceType = ../../types/ResourceType.dhall

let mkResourceType = ../ResourceType.dhall

let name = "github-list-repos"

in  { params =
        { get =
            { output_format = None Text } : GithubListRepos.get_params
        , put =
            {=} : GithubListRepos.put_params
        }
    , source =
        { exclude =
              λ(_params : { auth_token : Text, org : Text })
            →   { auth_token =
                    _params.auth_token
                , org =
                    _params.org
                , team =
                    None Text
                , exclude_regex =
                    None Text
                , exclude =
                    None (List Text)
                }
              : GithubListRepos.source_exclude
        , include =
              λ ( _params
                : { auth_token : Text, org : Text, include_regex : Text }
                )
            →   { auth_token =
                    _params.auth_token
                , org =
                    _params.org
                , team =
                    None Text
                , include_regex =
                    _params.include_regex
                }
              : GithubListRepos.source_include
        }
    , meta =
        { name =
            name
        , resource_type =
              mkResourceType.DockerImage
              { name =
                  name
              , repository =
                  "TODO-replaceme/github-list-repos"
              }
            : ResourceType
        }
    }
