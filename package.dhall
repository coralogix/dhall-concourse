  { resource-types =
        ./resource-types/package.dhall sha256:03db6af8ae63aa6aaab35efdc86e7cc8aac2938c908b704faca29087223e3cdd
      ? ./resource-types/package.dhall
  }
∧ (   ./domain.dhall sha256:036b9de47a7f54d4ed21b87c50987fb8a318c62524d7f6317d3ec98bbe9c784c
    ? ./domain.dhall
  )
