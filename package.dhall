{ resource-types =
      ./resource-types/package.dhall sha256:e602ce427a7394ae5054c35c4dfbe374ecad1730d63ebc64391b6cf47d2ebcc8
    ? ./resource-types/package.dhall
, Resource =
      ./Resource.dhall sha256:206f784b14f3fb78809bafffbde955fbc177ca0427c8fe9cf4a983a8aaf463c1
    ? ./Resource.dhall
, ResourceType =
      ./ResourceType.dhall sha256:41ead24540852689f7d08893e4f354358a26696b1d96762e5b188615a031cc06
    ? ./ResourceType.dhall
, Step =
      ./Step.dhall sha256:bc27631c06ca1ff19deca0f6205216f9c2cfa7b1f9a0c202c84f7ebc83c20716
    ? ./Step.dhall
, Task =
      ./Task.dhall sha256:d48a3c01812e363ce34a0928373c21658b92600e9e066a0c73014f4beefd61a4
    ? ./Task.dhall
, Job =
      ./Job.dhall sha256:84f8d5a8a81dae106a85655bd94a4469290222587ca07913907b39a7ebda5f6f
    ? ./Job.dhall
, Group =
      ./Group.dhall sha256:9531fd9c8bfbd69c94798d00093481d5266384bd6eed2dc3d76713d7e7a56c41
    ? ./Group.dhall
, Pipeline =
      ./Pipeline.dhall sha256:deb570e2d436b729ecfdf5f2a3fb96baa84321ce9950da95d4f412085cedca78
    ? ./Pipeline.dhall
, VarSource =
      ./VarSource.dhall sha256:d40e04bc69b0ccb965bfeb14cd7c7f33b3c99636f4a75771115030d27775a655
    ? ./VarSource.dhall
}