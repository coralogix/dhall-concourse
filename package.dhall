  { resource-types =
        ./resource-types/package.dhall sha256:2eda95d79ade1104863efb7fe0fe2dc7102649253f988ead3ad0233275bff78c
      ? ./resource-types/package.dhall
  }
∧ (   ./domain.dhall sha256:036b9de47a7f54d4ed21b87c50987fb8a318c62524d7f6317d3ec98bbe9c784c
    ? ./domain.dhall
  )
