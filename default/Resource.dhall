let Version = ../types/Version.dhall : Type

let ResourceSource = ../types/resources/_source.dhall : Type

let Resources = ../types/resources/package.dhall

let Resource = ../types/Resource.dhall : Type

let Defaults = ./resources/package.dhall

let getType =
        λ(source : ResourceSource)
      → let handlers =
              { ChartMuseum =
                    λ(_ : Resources.ChartMuseum.source)
                  → Defaults.ChartMuseum.meta.name
              , ConcoursePipeline =
                    λ(_ : Resources.ConcoursePipeline.source)
                  → Defaults.ConcoursePipeline.meta.name
              , DockerImage =
                    λ(_ : Resources.DockerImage.source)
                  → Defaults.DockerImage.meta.name
              , Git =
                  λ(_ : Resources.Git.source) → Defaults.Git.meta.name
              , GithubListRepos =
                    λ(_ : Resources.GithubListRepos.source)
                  → Defaults.GithubListRepos.meta.name
              , GithubPR =
                  λ(_ : Resources.GithubPR.source) → Defaults.GithubPR.meta.name
              , Helm =
                  λ(_ : Resources.Helm.source) → Defaults.Helm.meta.name
              , S3 =
                  λ(_ : Resources.S3.source) → Defaults.S3.meta.name
              , S3Bucket =
                  λ(_ : Resources.S3Bucket.source) → Defaults.S3Bucket.meta.name
              , Semver =
                  λ(_ : Resources.Semver.source) → Defaults.Semver.meta.name
              , SlackNotification =
                    λ(_ : Resources.SlackNotification.source)
                  → Defaults.SlackNotification.meta.name
              }
        
        in  merge handlers source : Text

in    λ(_params : { name : Text, source : ResourceSource })
    →   { name =
            _params.name
        , type =
            getType _params.source
        , version =
            None Version
        , check_every =
            None Text
        , tags =
            None (List Text)
        , webhook_token =
            None Text
        , source =
            _params.source
        }
      : Resource
