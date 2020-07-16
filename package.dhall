{ resource-types =
      ./resource-types/package.dhall sha256:e602ce427a7394ae5054c35c4dfbe374ecad1730d63ebc64391b6cf47d2ebcc8
    ? ./resource-types/package.dhall
, Resource =
      ./Resource.dhall sha256:206f784b14f3fb78809bafffbde955fbc177ca0427c8fe9cf4a983a8aaf463c1
    ? ./Resource.dhall
, ResourceType =
      ./ResourceType.dhall sha256:41ead24540852689f7d08893e4f354358a26696b1d96762e5b188615a031cc06
    ? ./ResourceType.dhall
}
