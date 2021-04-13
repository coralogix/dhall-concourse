  { resource-types =
        ./resource-types/package.dhall sha256:6fe23bc9227d1822e9a1df0f365e97ebf22c2469e3c892b177d1f9c1464dfb8f
      ? ./resource-types/package.dhall
  }
∧ (   ./domain.dhall sha256:56c38498a9f9ed945c76a1e8e880532151666850e78e82c05f4a56bcebeee00f
    ? ./domain.dhall
  )
