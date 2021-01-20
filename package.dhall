  { resource-types =
        ./resource-types/package.dhall sha256:fc1d84e1b7901ca2b90b3dd11e8688a09a8490427ecbe226694d91f74823005c
      ? ./resource-types/package.dhall
  }
∧ (   ./domain.dhall sha256:036b9de47a7f54d4ed21b87c50987fb8a318c62524d7f6317d3ec98bbe9c784c
    ? ./domain.dhall
  )
