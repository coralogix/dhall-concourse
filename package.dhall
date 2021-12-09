  { resource-types =
        ./resource-types/package.dhall sha256:03db6af8ae63aa6aaab35efdc86e7cc8aac2938c908b704faca29087223e3cdd
      ? ./resource-types/package.dhall
  }
∧ (   ./domain.dhall sha256:21359b4f74d086b79a975945f2305af7963a8633d886cf14f53217701abdc7ba
    ? ./domain.dhall
  )
