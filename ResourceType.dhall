let ResourceType
    : ∀(_params : { Source : Type, SourceGetParams : Type }) →
        { Type : Type
        , default :
            { privileged : Optional Bool
            , params : Optional _params.SourceGetParams
            , check_every : Optional Text
            , tags : Optional (List Text)
            , unique_version_history : Optional Bool
            }
        }
    = λ(_params : { Source : Type, SourceGetParams : Type }) →
        { Type =
            { name : Text
            , type : Text
            , source : _params.Source
            , privileged : Optional Bool
            , params : Optional _params.SourceGetParams
            , check_every : Optional Text
            , tags : Optional (List Text)
            , unique_version_history : Optional Bool
            }
        , default =
          { privileged = None Bool
          , params = None _params.SourceGetParams
          , check_every = None Text
          , tags = None (List Text)
          , unique_version_history = None Bool
          }
        }

let example =
      let RegistryImage = ./resource-types/RegistryImage.dhall

      let GithubListRepos = ./resource-types/GithubListRepos.dhall

      let Source = RegistryImage.Source.Type

      let SourceGetParams = RegistryImage.Params.Get.Type

      let ResourceType = ResourceType { Source, SourceGetParams }

      in  ResourceType::{
          , name = GithubListRepos.meta.name
          , type = RegistryImage.meta.name
          , source = RegistryImage.Source::GithubListRepos.meta.{ repository }
          , params = Some RegistryImage.Params.Get::{ format = Some "rootfs" }
          }

in  ResourceType
