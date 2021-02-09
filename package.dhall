  { resource-types =
        ./resource-types/package.dhall sha256:32bfaf7a01d8f59979f166519bd17d14fbfff16a9c59b90de83e7b99c0fef789
      ? ./resource-types/package.dhall
  }
∧ (   ./domain.dhall sha256:036b9de47a7f54d4ed21b87c50987fb8a318c62524d7f6317d3ec98bbe9c784c
    ? ./domain.dhall
  )
