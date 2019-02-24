let Version = ../types/Version.dhall : Type

let _version_schemas = ../types/resources/_version_schemas.dhall : Type

in  { every =
        Version.Every "every"
    , latest =
        Version.Latest "latest"
    , pinned =
        λ(version : _version_schemas) → Version.Pinned version
    }
