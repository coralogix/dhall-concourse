# dhall-concourse

> Dhall types for Concourse

## Description

This repository includes [Dhall](https://github.com/dhall-lang/dhall-lang) schemas which model the Concourse CI pipeline domain, which is documented in the [Concourse CI documentation reference](https://concourse-ci.org/pipelines.html).

This allows the user to more easily generate type-safe Concourse CI pipelines, through the use of the Dhall project's `dhall-to-yaml` tool.

### Supported Resources
* Concourse Pipeline - [`concourse/concourse-pipeline-resource`](https://github.com/concourse/concourse-pipeline-resource)
* Coralogix Event - [`coralogix/eng-concourse-resource-coralogix-event`](https://github.com/coralogix/eng-concourse-resource-coralogix-event)
* Dhall - [`coralogix/eng-concourse-resource-dhall`](https://github.com/coralogix/eng-concourse-resource-dhall)
* Docker Image - [`concourse/docker-image-resource`](https://github.com/concourse/docker-image-resource)
* Git - [`concourse/git-resource`](https://github.com/concourse/git-resource)
* Github List Repos - [`coralogix/eng-concourse-resource-github-list-repos`](https://github.com/coralogix/eng-concourse-resource-github-list-repos)
* Github PR - [`telia-oss/github-pr-resource`](https://github.com/telia-oss/github-pr-resource)
* Github Release - [`concourse/github-release-resource`](https://github.com/concourse/github-release-resource)
* Github Status - [`colstrom/concourse-github-status`](https://github.com/colstrom/concourse-github-status)
* Git Multibranch - [`cloudfoundry-community/git-multibranch-resource`](https://github.com/cloudfoundry-community/git-multibranch-resource)
* Helm 3 - [`Typositoire/concourse-helm3-resource`](https://github.com/Typositoire/concourse-helm3-resource)
* Kops - [`coralogix/eng-concourse-resource-kops`](https://github.com/coralogix/eng-concourse-resource-kops)
* Registry Image - [`concourse/registry-image-resource`](https://github.com/concourse/registry-image-resource)
* S3 - [`concourse/s3-resource`](https://github.com/concourse/s3-resource)
* S3 Bucket - [`18F/s3-resource-simple`](https://github.com/18F/s3-resource-simple)
* Slack Notification - [`cloudfoundry-community/slack-notification-resource`](https://github.com/cloudfoundry-community/slack-notification-resource)
* Time - [`concourse/time-resource`](https://github.com/concourse/time-resource)

## Install
For stability, users are encouraged to import from a tagged release, not from the master branch, and to watch for new releases. This project does not yet have rigorous testing set up for it and new commits on the master branch are prone to break compatibility and are almost sure to change the import hash for the expression, thus the releases are currently `v0.x`.

You should generally import `domain.dhall`, which includes `Resource`, `ResourceType`, `Step`, `Task`, `Job`, `Group`, `Pipeline`, and `VarSource`, and merge it with the resource types that you need. For example,
```dhall
let Concourse =
        https://raw.githubusercontent.com/coralogix/dhall-concourse/v0.14.0/domain.dhall sha256:56c38498a9f9ed945c76a1e8e880532151666850e78e82c05f4a56bcebeee00f
      ∧ { RegistryImage =
            https://raw.githubusercontent.com/coralogix/dhall-concourse/v0.14.0/resource-types/RegistryImage.dhall sha256:2ca4df79f82f54275f919d759344a6478749f7d0f32bddbc0389877ede11da03
        , Git =
            https://raw.githubusercontent.com/coralogix/dhall-concourse/v0.14.0/resource-types/Git.dhall sha256:830b9d7d0e9e0992ee2473f78e05838a86be3e13c7bcf5df661b8829dbc3d558
        }

in  Concourse
```


## Intended Usage

### Resources

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
let Git = https://raw.githubusercontent.com/coralogix/dhall-concourse/v0.14.0/resource-types/Git.dhall sha256:830b9d7d0e9e0992ee2473f78e05838a86be3e13c7bcf5df661b8829dbc3d558

let S3 = https://raw.githubusercontent.com/coralogix/dhall-concourse/v0.14.0/resource-types/S3.dhall sha256:b49ec06747630f6d6951fde4f04f7bbffab7cee1a9ef299464314ad049422d04

let Source = < Git : Git.Source.Type | S3 : S3.Source.Type >

let Version = < Git : Git.Version.Type | S3 : S3.Version.Type >

let Resource =
   let import = https://raw.githubusercontent.com/coralogix/dhall-concourse/v0.14.0/Resource.dhall sha256:206f784b14f3fb78809bafffbde955fbc177ca0427c8fe9cf4a983a8aaf463c1

   in import { Source, Version }

in  Resource::{
    , name = "example-repository"
    , type = Git.meta.name
    , source =
        Source.Git
          Git.Source::{ uri = "git@github.com:example/example.git" }
    }
```

### Steps

Steps follow the same model as Resources, except that instead of providing `Source` and `Version` as parameters, instead the types for `on_success`, `on_failure`, etc. must be provided as parameters.
This solves the issue in the Concourse pipeline domain where Steps are recursive types, which are not natively supported by Dhall (as Dhall guarantees totality). At the "end of the recursion", so to speak, when the generated pipeline should not provide an `on_success`, etc., then the type that should be provided to the function should be `<>` (which is Dhall's closest equivalent to a `Void` type).

As resources, resource types, and steps are types constructed by the downstream user, so too are helper functions provided to construct the types for jobs and pipelines.

## Maintainers
[Ari Becker](https://github.com/ari-becker)
[Oded David](https://github.com/oded-dd)

## Contributing
TBD

## License
[Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0) © Coralogix, Inc.
