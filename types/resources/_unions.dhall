{ version =
    < ChartMuseum :
        (./ChartMuseum.dhall).version.schema
    | ConcoursePipeline :
        (./ConcoursePipeline.dhall).version.schema
    | DockerImage :
        (./DockerImage.dhall).version.schema
    | Git :
        (./Git.dhall).version.schema
    | GithubListRepos :
        (./GithubListRepos.dhall).version.schema
    | GithubPR :
        (./GithubPR.dhall).version.schema
    | Helm :
        (./Helm.dhall).version.schema
    | S3 :
        (./S3.dhall).version.schema
    | S3Bucket :
        (./S3Bucket.dhall).version.schema
    | Semver :
        (./Semver.dhall).version.schema
    | SlackNotification :
        (./SlackNotification.dhall).version.schema
    >
, params =
    { get =
          < ChartMuseum :
              (./ChartMuseum.dhall).params.get.schema
          | ConcoursePipeline :
              (./ConcoursePipeline.dhall).params.get.schema
          | DockerImage :
              (./DockerImage.dhall).params.get.schema
          | Git :
              (./Git.dhall).params.get.schema
          | GithubListRepos :
              (./GithubListRepos.dhall).params.get.schema
          | GithubPR :
              (./GithubPR.dhall).params.get.schema
          | Helm :
              (./Helm.dhall).params.get.schema
          | S3 :
              (./S3.dhall).params.get.schema
          | S3Bucket :
              (./S3Bucket.dhall).params.get.schema
          | Semver :
              (./Semver.dhall).params.get.schema
          | SlackNotify :
              (./SlackNotification.dhall).params.get.schema
          >
        : Type
    , put =
          < ChartMuseum :
              (./ChartMuseum.dhall).params.put.schema
          | ConcoursePipeline :
              (./ConcoursePipeline.dhall).params.put.schema
          | DockerImage :
              (./DockerImage.dhall).params.put.schema
          | Git :
              (./Git.dhall).params.put.schema
          | GithubListRepos :
              (./GithubListRepos.dhall).params.put.schema
          | GithubPR :
              (./GithubPR.dhall).params.put.schema
          | Helm :
              (./Helm.dhall).params.put.schema
          | S3 :
              (./S3.dhall).params.put.schema
          | S3Bucket :
              (./S3Bucket.dhall).params.put.schema
          | Semver :
              (./Semver.dhall).params.put.schema
          | SlackNotify :
              (./SlackNotification.dhall).params.put.schema
          >
        : Type
    }
, source =
    { resource =
          < ChartMuseum :
              (./ChartMuseum.dhall).source.schema
          | ConcoursePipeline :
              (./ConcoursePipeline.dhall).source.schema
          | DockerImage :
              (./DockerImage.dhall).source.schema
          | Git :
              (./Git.dhall).source.schema
          | GithubListRepos :
              (./GithubListRepos.dhall).source.schema
          | GithubPR :
              (./GithubPR.dhall).source.schema
          | Helm :
              (./Helm.dhall).source.schema
          | S3 :
              (./S3.dhall).source.schema
          | S3Bucket :
              (./S3Bucket.dhall).source.schema
          | Semver :
              (./Semver.dhall).source.schema
          | SlackNotification :
              (./SlackNotification.dhall).source.schema
          >
        : Type
    , resource_type =
        < DockerImage : (./DockerImage.dhall).source.schema > : Type
    }
}
