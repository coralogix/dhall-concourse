  < ChartMuseum :
      (./ChartMuseum.dhall).source
  | ConcoursePipeline :
      (./ConcoursePipeline.dhall).source
  | DockerImage :
      (./DockerImage.dhall).source
  | Git :
      (./Git.dhall).source
  | GithubListRepos :
      (./GithubListRepos.dhall).source
  | GithubPR :
      (./GithubPR.dhall).source
  | Helm :
      (./Helm.dhall).source
  | S3 :
      (./S3.dhall).source
  | S3Bucket :
      (./S3Bucket.dhall).source
  | Semver :
      (./Semver.dhall).source
  | SlackNotification :
      (./SlackNotification.dhall).source
  >
: Type
