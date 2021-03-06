{ ConcoursePipeline =
      ./ConcoursePipeline.dhall sha256:e2229add33a80283eb3c1c29f91c2a6cdc9e90a2ded04048d221c5d53048ccb0
    ? ./ConcoursePipeline.dhall
, CoralogixEvent =
      ./CoralogixEvent.dhall sha256:c32bedf3eda23d4d7ca10184211d114c809ecf6d61e002f386cf99aad8dc0d27
    ? ./CoralogixEvent.dhall
, Dhall =
      ./Dhall.dhall sha256:49dab2ab893b7a4a0e1e39bbe3e28f383f5079e89fe143d1a694c38835cc566b
    ? ./Dhall.dhall
, DockerImage =
      ./DockerImage.dhall sha256:fefdd6afd28509eabd06008093cfe523ff4ea0c1f50b975f658204ce7f3f3c59
    ? ./DockerImage.dhall
, Git =
      ./Git.dhall sha256:830b9d7d0e9e0992ee2473f78e05838a86be3e13c7bcf5df661b8829dbc3d558
    ? ./Git.dhall
, GitMultibranch =
      ./GitMultibranch.dhall sha256:98145e49333017e27c759b3bb02aeaefc14dc89b207afd74d2c1ebdc64a59b48
    ? ./GitMultibranch.dhall
, GithubListRepos =
      ./GithubListRepos.dhall sha256:b2f43a53a911c4fa0effbb810256d94bf621f2e2f57c067dea71b65eb224cbce
    ? ./GithubListRepos.dhall
, GithubPR =
      ./GithubPR.dhall sha256:34fc7517dff51abc3ecfcf879506940e76e5339c893e5f6ade0d025bb992b2cc
    ? ./GithubPR.dhall
, GithubRelease =
      ./GithubRelease.dhall sha256:1b782f3c5b49ccce426bb3364add8290aa83e267da5af95b5493ba2038f5ab36
    ? ./GithubRelease.dhall
, GithubStatus =
      ./GithubStatus.dhall sha256:386931b4d5af36df90523b09e4f99b2da1eb172a713860c72d1d253b07545b6f
    ? ./GithubStatus.dhall
, Helm3 =
      ./Helm3.dhall sha256:baf8a8d5d435c0f154f575430605702c47a523442c8c09c0e3054f14729b0bc8
    ? ./Helm3.dhall
, RegistryImage =
      ./RegistryImage.dhall sha256:2ca4df79f82f54275f919d759344a6478749f7d0f32bddbc0389877ede11da03
    ? ./RegistryImage.dhall
, S3 =
      ./S3.dhall sha256:b49ec06747630f6d6951fde4f04f7bbffab7cee1a9ef299464314ad049422d04
    ? ./S3.dhall
, S3Bucket =
      ./S3Bucket.dhall sha256:fc95953a8603a450c4e34b7394714332ede9759436256f153d00a829fddccc31
    ? ./S3Bucket.dhall
, SlackNotification =
      ./SlackNotification.dhall sha256:637b51d4ea5273e22d60c4c3dcee9ebc87e4316254abcf1c4ba27fe7d9cc720f
    ? ./SlackNotification.dhall
, Time =
      ./Time.dhall sha256:31a94594fb11d939559befed5307954463d9832fc0c9e085455ebb08689932e2
    ? ./Time.dhall
, Kops =
      ./Kops.dhall sha256:362b724a62db7292902efa8d27886bfb713a91db523c1459828861e09e33727c
    ? ./Kops.dhall
}
