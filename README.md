# dhall-concourse

[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

> Dhall types for Concourse

This repository includes types, default records, and functions that produce default records in the [Dhall language](https://github.com/dhall-lang/dhall-lang) which model the Concourse CI pipeline domain. They are based off the [Concourse CI documentation reference](https://concourse-ci.org/pipelines.html).

This allows the user to more easily generate type-safe Concourse CI pipelines, through the use of the Dhall project's `dhall-to-yaml` tool.

## Install
```
https://raw.githubusercontent.com/coralogix/dhall-concourse/v0.1.0/default/package.dhall sha256:0de9b0697eab2abd39f3948422153f720f34b3e0a7d7691399f373b3b5e151c5
https://raw.githubusercontent.com/coralogix/dhall-concourse/v0.1.0/types/package.dhall sha256:d4c2059f128ca433eb6964d5215b129b6772d1383f8172461a6828fd9e225cb6
```

## Usage
For example - generating the documentation's smallest pipeline example:
```dhall
-- hello-world-pipeline.dhall

let Concourse =
      https://raw.githubusercontent.com/coralogix/dhall-concourse/v0.1.0/default/package.dhall sha256:0de9b0697eab2abd39f3948422153f720f34b3e0a7d7691399f373b3b5e151c5

let ConcourseTypes =
      https://raw.githubusercontent.com/coralogix/dhall-concourse/v0.1.0/types/package.dhall sha256:d4c2059f128ca433eb6964d5215b129b6772d1383f8172461a6828fd9e225cb6

in  Concourse.Pipeline
    { jobs =
        [ Concourse.Job
          { name =
              "hello-world"
          , plan =
              [ ConcourseTypes.Step.Task
                (   Concourse.Task { task = "say-hello" }
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
                                ( Concourse.TaskConfigImageResource
                                  { type =
                                      "docker-image"
                                  , repository =
                                      "alpine"
                                  }
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

## Maintainer
[Ari Becker](https://github.com/ari-becker)

## Contributing
TBD

## License
[Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0) © Coralogix, Inc.