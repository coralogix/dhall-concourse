  { resource-types =
        ./resource-types/package.dhall sha256:3cd3afa8904b3b35d80e7290e11bc28281500b8dc436c1b06e90b48e7b44a224
      ? ./resource-types/package.dhall
  }
∧ (   ./domain.dhall sha256:036b9de47a7f54d4ed21b87c50987fb8a318c62524d7f6317d3ec98bbe9c784c
    ? ./domain.dhall
  )
