let GithubListRepos = ../../types/resources/GithubListRepos.dhall

let DockerImage = ../../types/resources/DockerImage.dhall

let RegistryImage = ../../types/resources/RegistryImage.dhall

let ResourceType = ../../types/ResourceType.dhall

let mkResourceType = ../ResourceType.dhall

let name = "github-list-repos"

let repository = "quay.io/coralogix/concourse-resource-github-list-repos"

let image_tag = "v0.3.1"

in  { version =
          λ(_params : { hash : Text })
        → { hash = _params.hash } : GithubListRepos.version.schema
    , params =
        { get =
            { output_format = None Text } : GithubListRepos.params.get.schema
        , put = {=} : GithubListRepos.params.put.schema
        }
    , source =
        { exclude =
              λ(_params : { auth_token : Text, org : Text })
            →   { auth_token = _params.auth_token
                , org = _params.org
                , team = None Text
                , exclude_regex = None Text
                , exclude = None (List Text)
                }
              : GithubListRepos.source.exclude.schema
        , include =
              λ ( _params
                : { auth_token : Text, org : Text, include_regex : Text }
                )
            →   { auth_token = _params.auth_token
                , org = _params.org
                , team = None Text
                , include_regex = _params.include_regex
                }
              : GithubListRepos.source.include.schema
        }
    , meta =
        { name = name
        , repository = repository
        , image_tag = image_tag
        , resource_type =
            { docker =
                ResourceType.schema.DockerImage
                  ( let default =
                          mkResourceType.DockerImage
                            { name = name, repository = repository }
                    
                    in      default
                          ⫽ { source = default.source ⫽ { tag = Some image_tag }
                            }
                        : ResourceType.docker-image.schema
                  )
            , registry =
                ResourceType.schema.RegistryImage
                  ( let default =
                          mkResourceType.RegistryImage
                            { name = name, repository = repository }
                    
                    in      default
                          ⫽ { source = default.source ⫽ { tag = Some image_tag }
                            }
                        : ResourceType.registry-image.schema
                  )
            }
        }
    }
