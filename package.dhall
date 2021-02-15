  { resource-types =
        ./resource-types/package.dhall sha256:1673603426aea40b660badef0cae5273db40e79f78b7d4d6a32aff42679e4a54
      ? ./resource-types/package.dhall
  }
∧ (   ./domain.dhall sha256:036b9de47a7f54d4ed21b87c50987fb8a318c62524d7f6317d3ec98bbe9c784c
    ? ./domain.dhall
  )
