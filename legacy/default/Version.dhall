let Version = ../types/Version.dhall : Type

let _version_schemas = (../types/resources/_unions.dhall).version : Type

in  { every =
        Version.Every "every"
    , latest =
        Version.Latest "latest"
    , pinned =
        λ(version : _version_schemas) → Version.Pinned version
    }
