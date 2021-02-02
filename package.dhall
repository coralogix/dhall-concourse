  { resource-types =
        ./resource-types/package.dhall sha256:7f97ce54ed763327444e5f74ff8a456d5a03131e28562b34b0bbf5521132dd0d
      ? ./resource-types/package.dhall
  }
∧ (   ./domain.dhall sha256:036b9de47a7f54d4ed21b87c50987fb8a318c62524d7f6317d3ec98bbe9c784c
    ? ./domain.dhall
  )
