  { resource-types =
        ./resource-types/package.dhall sha256:49c469688d2645408f3d8c547a8e8bfde63aa12059d872a58b8331c055ba85ab
      ? ./resource-types/package.dhall
  }
∧ (   ./domain.dhall sha256:036b9de47a7f54d4ed21b87c50987fb8a318c62524d7f6317d3ec98bbe9c784c
    ? ./domain.dhall
  )
