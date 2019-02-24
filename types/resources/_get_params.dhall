  < ChartMuseum :
      (./ChartMuseum.dhall).get_params
  | ConcoursePipeline :
      (./ConcoursePipeline.dhall).get_params
  | DockerImage :
      (./DockerImage.dhall).get_params
  | Git :
      (./Git.dhall).get_params
  | GithubListRepos :
      (./GithubListRepos.dhall).get_params
  | GithubPR :
      (./GithubPR.dhall).get_params
  | Helm :
      (./Helm.dhall).get_params
  | S3 :
      (./S3.dhall).get_params
  | S3Bucket :
      (./S3Bucket.dhall).get_params
  | Semver :
      (./Semver.dhall).get_params
  | SlackNotify :
      (./SlackNotification.dhall).get_params
  >
: Type
