let Resource
    : ∀(_params : { Source : Type, Version : Type }) →
        { Type : Type
        , default :
            { icon : Optional Text
            , version : Optional _params.Version
            , check_every : Optional Text
            , tags : Optional (List Text)
            , public : Optional Bool
            , webhook_token : Optional Text
            }
        }
    = λ(_params : { Source : Type, Version : Type }) →
        { Type =
            { name : Text
            , type : Text
            , source : _params.Source
            , icon : Optional Text
            , version : Optional _params.Version
            , check_every : Optional Text
            , tags : Optional (List Text)
            , public : Optional Bool
            , webhook_token : Optional Text
            }
        , default =
          { icon = None Text
          , version = None _params.Version
          , check_every = None Text
          , tags = None (List Text)
          , public = None Bool
          , webhook_token = None Text
          }
        }

let example =
      let Git = ./resource-types/Git.dhall

      let S3 = ./resource-types/S3.dhall

      let Source = < Git : Git.Source.Type | S3 : S3.Source.Type >

      let Version = < Git : Git.Version.Type | S3 : S3.Version.Type >

      let Resource = Resource { Source, Version }

      in  Resource::{
          , name = "example-repository"
          , type = Git.meta.name
          , source =
              Source.Git
                Git.Source::{ uri = "git@github.com:example/example.git" }
          }

in  Resource
