  < ChartMuseum :
      (./ChartMuseum.dhall).put_params
  | ConcoursePipeline :
      (./ConcoursePipeline.dhall).put_params
  | DockerImage :
      (./DockerImage.dhall).put_params
  | Git :
      (./Git.dhall).put_params
  | GithubListRepos :
      (./GithubListRepos.dhall).put_params
  | GithubPR :
      (./GithubPR.dhall).put_params
  | Helm :
      (./Helm.dhall).put_params
  | S3 :
      (./S3.dhall).put_params
  | S3Bucket :
      (./S3Bucket.dhall).put_params
  | Semver :
      (./Semver.dhall).put_params
  | SlackNotify :
      (./SlackNotification.dhall).put_params
  >
: Type
