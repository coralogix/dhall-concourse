  { resource-types =
        ./resource-types/package.dhall sha256:8d480d97bee6a70f06fd41587a8785a0c73450631642e160e297663eb164e039
      ? ./resource-types/package.dhall
  }
∧ (   ./domain.dhall sha256:036b9de47a7f54d4ed21b87c50987fb8a318c62524d7f6317d3ec98bbe9c784c
    ? ./domain.dhall
  )
