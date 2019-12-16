let Version = ../types/Version.dhall : Type

let ResourceSource = (../types/resources/_unions.dhall).source.resource : Type

let Resources = ../types/resources/package.dhall

let Resource = ../types/Resource.dhall : Type

let Defaults = ./resources/package.dhall

let getType =
        λ(source : ResourceSource)
      → let handlers =
              { ChartMuseum =
                    λ(_ : Resources.ChartMuseum.source.schema)
                  → Defaults.ChartMuseum.meta.name
              , ConcoursePipeline =
                    λ(_ : Resources.ConcoursePipeline.source.schema)
                  → Defaults.ConcoursePipeline.meta.name
              , DockerImage =
                    λ(_ : Resources.DockerImage.source.schema)
                  → Defaults.DockerImage.meta.name
              , Git =
                  λ(_ : Resources.Git.source.schema) → Defaults.Git.meta.name
              , GithubListRepos =
                    λ(_ : Resources.GithubListRepos.source.schema)
                  → Defaults.GithubListRepos.meta.name
              , GithubPR =
                    λ(_ : Resources.GithubPR.source.schema)
                  → Defaults.GithubPR.meta.name
              , Helm =
                  λ(_ : Resources.Helm.source.schema) → Defaults.Helm.meta.name
              , RegistryImage =
                    λ(_ : Resources.RegistryImage.source.schema)
                  → Defaults.RegistryImage.meta.name
              , S3 = λ(_ : Resources.S3.source.schema) → Defaults.S3.meta.name
              , S3Bucket =
                    λ(_ : Resources.S3Bucket.source.schema)
                  → Defaults.S3Bucket.meta.name
              , Semver =
                    λ(_ : Resources.Semver.source.schema)
                  → Defaults.Semver.meta.name
              , SlackNotification =
                    λ(_ : Resources.SlackNotification.source.schema)
                  → Defaults.SlackNotification.meta.name
              }
        
        in  merge handlers source : Text

in    λ(_params : { name : Text, source : ResourceSource })
    →   { name = _params.name
        , type = getType _params.source
        , version = None Version
        , check_every = None Text
        , tags = None (List Text)
        , webhook_token = None Text
        , source = _params.source
        }
      : Resource
