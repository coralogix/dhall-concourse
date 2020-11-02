  { resource-types =
        ./resource-types/package.dhall sha256:44660ad120799084b30751f4e8d7a628255b6e76f0b93ab6fc0e43643328a854
      ? ./resource-types/package.dhall
  }
∧ (   ./domain.dhall sha256:036b9de47a7f54d4ed21b87c50987fb8a318c62524d7f6317d3ec98bbe9c784c
    ? ./domain.dhall
  )
