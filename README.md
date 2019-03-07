# dhall-concourse

[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

> Dhall types for Concourse

This repository includes types, default records, and functions that produce default records in the [Dhall language](https://github.com/dhall-lang/dhall-lang) which model the Concourse CI pipeline domain. They are based off the [Concourse CI documentation reference](https://concourse-ci.org/pipelines.html).

This allows the user to more easily generate type-safe Concourse CI pipelines, through the use of the Dhall project's `dhall-to-yaml` tool.

### Limitations
* Various steps have not yet been incorporated into the model: `aggregate`, `do`, and `try`.
* Various step modifiers have not yet been incorporated into the model: `tags`, `timeout`, and `attempts`.
* Resources need to be added to the project to be usable. From the benefit of experience of the maintainers, this seems to ultimately be the result of Dhall not (yet) supporting dependent types, and cannot be worked around at this time without losing type safety for each Resource's source, get parameters, and put parameters' types. As a result, this project violates Concourse's [`contributor-burden`](https://github.com/concourse/concourse/wiki/Anti-Patterns#contributor-burden) anti-pattern, and is unlikely to become an official Concourse project. Users who wish to use resources not included in the project are encouraged to open pull requests.
* The Concourse pipeline models `Step`s as recursive types, as each `Step` record has fields `on_success`, `on_failure`, `on_abort`, and `ensure` of type `Step`. While there is an official [guide](https://github.com/dhall-lang/dhall-lang/wiki/How-to-translate-recursive-code-to-Dhall) that documents a strategy for implementing a recursive type within Dhall's restrictions, currently `dhall-concourse` does not adopt that strategy. Instead, a `Step` has fields of type `StepHook`, and `StepHook`s do not have recursive fields. For the time being, this addresses most use cases while presenting a more-easily addressable API to the user. The project is open to pull requests that offer an additional level of recursion, and may adopt the official strategy for transforming recursive code in the future.

### Supported Resources
* ChartMuseum - [`cathive/concourse-chartmuseum-resource`](https://github.com/cathive/concourse-chartmuseum-resource)
* Concourse Pipeline - [`concourse/concourse-pipeline-resource`](https://github.com/concourse/concourse-pipeline-resource)
* Docker Image - [`concourse/docker-image-resource`](https://github.com/concourse/docker-image-resource)
* Git - [`concourse/git-resource`](https://github.com/concourse/git-resource)
* Github List Repos - [`coralogix/eng-concourse-resource-github-list-repos`](https://github.com/coralogix/eng-concourse-resource-github-list-repos)
* Github PR - [`telia-oss/github-pr-resource`](https://github.com/telia-oss/github-pr-resource)
* Helm - [`linkyard/concourse-helm-resource`](https://github.com/linkyard/concourse-helm-resource)
* Registry Image - [`concourse/registry-image-resource`](https://github.com/concourse/registry-image-resource)
* S3 - [`concourse/s3-resource`](https://github.com/concourse/s3-resource)
* S3 Bucket - [`18F/s3-resource-simple`](https://github.com/18F/s3-resource-simple)
* Semver - [`concourse/semver-resource`](https://github.com/concourse/semver-resource)
* Slack Notification - [`cloudfoundry-community/slack-notification-resource`](https://github.com/cloudfoundry-community/slack-notification-resource)

## Install
For stability, users are encouraged to import from a tagged release, not from the master branch, and to watch for new releases. This project does not yet have rigorous testing set up for it and new commits on the master branch are prone to break compatibility and are almost sure to change the import hash for the expression, thus the releases are currently `v0.x`.
```
https://raw.githubusercontent.com/coralogix/dhall-concourse/v0.2.0/default/package.dhall sha256:abf762790868eae1b23cbaaa68d727c035348c4945e9471c2d8114918bc9a5ed
https://raw.githubusercontent.com/coralogix/dhall-concourse/v0.2.0/types/package.dhall sha256:2eed1cee33b473b1304fad3054da2facc2293b75d7786d991e461669bf305b6a
```

## Usage
For example - generating the documentation's smallest pipeline example:
```dhall
-- hello-world-pipeline.dhall

let Concourse =
      https://raw.githubusercontent.com/coralogix/dhall-concourse/v0.2.0/default/package.dhall sha256:abf762790868eae1b23cbaaa68d727c035348c4945e9471c2d8114918bc9a5ed

let ConcourseTypes =
      https://raw.githubusercontent.com/coralogix/dhall-concourse/v0.2.0/types/package.dhall sha256:2eed1cee33b473b1304fad3054da2facc2293b75d7786d991e461669bf305b6a

in  Concourse.Pipeline
    { jobs =
        [ Concourse.Job
          { name =
              "hello-world"
          , plan =
              [ ConcourseTypes.Step.Task
                (   Concourse.Task
                    { task = "say-hello" }
                  ⫽ { config =
                        Some
                        (   Concourse.TaskConfig
                            { platform =
                                "linux"
                            , run =
                                  Concourse.TaskConfigRun { path = "echo" }
                                ⫽ { args = Some [ "Hello, world!" ] }
                            }
                          ⫽ { image_resource =
                                Some
                                ( ConcourseTypes.TaskConfigImageResource.schema.DockerImage
                                  ( Concourse.TaskConfigDockerImageResource
                                    { repository = "alpine" }
                                  )
                                )
                            }
                        )
                    }
                )
              ]
          }
        ]
    }
```
### CLI
```bash
dhall-to-yaml --omitNull <<< './hello-world-pipeline.dhall' > hello-world-pipeline.yaml
fly -t main set-pipeline -p hello-world -c ./hello-world-pipeline.yaml 
```

## Maintainers
[Ari Becker](https://github.com/ari-becker)
[Oded David](https://github.com/oded-dd)

## Contributing
TBD

## License
[Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0) © Coralogix, Inc.