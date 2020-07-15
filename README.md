# dhall-concourse

> Dhall types for Concourse

## Historical Notice
This project now contains only the types used by various resource types used in Concourse pipelines. It used to attempt to cover the entire domain of Concourse pipelines, including steps. That work is currently dormant, and is archived under `legacy/`.

Expanding the domain supported by `dhall-concourse` caused performance to become unbearably slow and expensive. For non-trivial pipelines, parsing times reached 40+ minutes and could consume 10+ GB of memory. The slow and expensive performance was due to the increasing numbers of deeply-nested unions being added to the model, and currently, large nested unions are not handled performantly by the Haskell reference implementation.

At such time as a Dhall implementation will mature to the point where working with the model becomes performant, work will resume on this project.

## Description

This repository includes [Dhall](https://github.com/dhall-lang/dhall-lang) schemas which model various resource types in the Concourse CI pipeline domain, which is documented in the [Concourse CI documentation reference](https://concourse-ci.org/pipelines.html).

This allows the user to more easily generate type-safe Concourse CI pipelines, through the use of the Dhall project's `dhall-to-yaml` tool.

### Supported Resources
* Concourse Pipeline - [`concourse/concourse-pipeline-resource`](https://github.com/concourse/concourse-pipeline-resource)
* Dhall - [`coralogix/eng-concourse-resource-dhall`](https://github.com/coralogix/eng-concourse-resource-dhall)
* Docker Image - [`concourse/docker-image-resource`](https://github.com/concourse/docker-image-resource)
* Git - [`concourse/git-resource`](https://github.com/concourse/git-resource)
* Github List Repos - [`coralogix/eng-concourse-resource-github-list-repos`](https://github.com/coralogix/eng-concourse-resource-github-list-repos)
* Github PR - [`telia-oss/github-pr-resource`](https://github.com/telia-oss/github-pr-resource)
* Git Multibranch - [`cloudfoundry-community/git-multibranch-resource`](https://github.com/cloudfoundry-community/git-multibranch-resource)
* Registry Image - [`concourse/registry-image-resource`](https://github.com/concourse/registry-image-resource)
* S3 - [`concourse/s3-resource`](https://github.com/concourse/s3-resource)
* S3 Bucket - [`18F/s3-resource-simple`](https://github.com/18F/s3-resource-simple)
* Slack Notification - [`cloudfoundry-community/slack-notification-resource`](https://github.com/cloudfoundry-community/slack-notification-resource)

## Install
For stability, users are encouraged to import from a tagged release, not from the master branch, and to watch for new releases. This project does not yet have rigorous testing set up for it and new commits on the master branch are prone to break compatibility and are almost sure to change the import hash for the expression, thus the releases are currently `v0.x`.
To import everything, use:
```
https://raw.githubusercontent.com/coralogix/dhall-concourse/v0.4.0/package.dhall sha256:a82cb4bdc359bdea12fde89119c6c3e64ccae1392c716106743b9a8a9eb04b4f
```

## Intended Usage

The Concourse pipeline schema requires that every `resource_type`, `resource`, `get` step, etc. are exactly the same - except for their `source` and `params` fields, whose contents depend on which resource type is being referred to. The naive way to represent this (for example, for a resource) in Dhall is by writing:

```dhall
let Resource =
  { name : Text
  , type : Text
  , source : ?
  -- other fields
  }
in Resource
```

This introduces a question - what should the type of the `source` field be? Maintaining the union of all of the possibilities of the `source` field becomes tedious. But putting a union of every possible alternative, of every possible resource type in existence, would make the resulting normal form too large to be performant (even if it were possible to maintain them all in a single repository).

This repository allows the user to construct the type of `Resource` and of `ResourceType` based on a union that the downstream user constructs, consisting only of the resource types which the downstream user actually uses in their pipeline. This solves both the code-reusage problem, and keeps the implementation performant. For example:

```dhall
let Git = https://raw.githubusercontent.com/coralogix/dhall-concourse/v0.4.0/resource-types/Git.dhall sha256:830b9d7d0e9e0992ee2473f78e05838a86be3e13c7bcf5df661b8829dbc3d558

let S3 = https://raw.githubusercontent.com/coralogix/dhall-concourse/v0.4.0/resource-types/S3.dhall sha256:6e062defd2cf94a3f7840d1b09c7a832d0a92467f5924a2b812843c053a8eca5

let Source = < Git : Git.Source.Type | S3 : S3.Source.Type >

let Version = < Git : Git.Version.Type | S3 : S3.Version.Type >

let Resource =
   let import = https://raw.githubusercontent.com/coralogix/dhall-concourse/v0.4.0/Resource.dhall sha256:206f784b14f3fb78809bafffbde955fbc177ca0427c8fe9cf4a983a8aaf463c1

   in import { Source, Version }

in  Resource::{
    , name = "example-repository"
    , type = Git.meta.name
    , source =
        Source.Git
          Git.Source::{ uri = "git@github.com:example/example.git" }
    }
```

## Maintainers
[Ari Becker](https://github.com/ari-becker)
[Oded David](https://github.com/oded-dd)

## Contributing
TBD

## License
[Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0) © Coralogix, Inc.
