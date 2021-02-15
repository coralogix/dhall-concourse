  { resource-types =
        ./resource-types/package.dhall sha256:625db0cd12a374fa322b5290a504a0506a3be8a540176329b0c40142741308a6
      ? ./resource-types/package.dhall
  }
∧ (   ./domain.dhall sha256:036b9de47a7f54d4ed21b87c50987fb8a318c62524d7f6317d3ec98bbe9c784c
    ? ./domain.dhall
  )
