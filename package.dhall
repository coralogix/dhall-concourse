  { resource-types =
        ./resource-types/package.dhall sha256:130fd5ab6ba3ec7458889d5f0ea733a9f70aade5916cc62ab9ebf3c806e9c670
      ? ./resource-types/package.dhall
  }
∧ (   ./domain.dhall sha256:036b9de47a7f54d4ed21b87c50987fb8a318c62524d7f6317d3ec98bbe9c784c
    ? ./domain.dhall
  )
