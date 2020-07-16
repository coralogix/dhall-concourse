let ImageResource
    : ∀(_params : { source : Type, get_params : Type, version : Type }) →
        { Type : Type
        , default :
            { params : Optional _params.get_params
            , version : Optional _params.version
            }
        }
    = λ(_params : { source : Type, get_params : Type, version : Type }) →
        { Type =
            { type : Text
            , source : _params.source
            , params : Optional _params.get_params
            , version : Optional _params.version
            }
        , default =
          { params = None _params.get_params, version = None _params.version }
        }

let Input =
      { Type = { name : Text, path : Optional Text, optional : Optional Bool }
      , default = { path = None Text, optional = None Bool }
      }

let Output =
      { Type = { name : Text, path : Optional Text }, default.path = None Text }

let Cache = { Type = { path : Text }, default = {=} }

let Run =
      { Type =
          { path : Text
          , args : Optional (List Text)
          , dir : Optional Text
          , user : Optional Text
          }
      , default = { args = None (List Text), dir = None Text, user = None Text }
      }

let ContainerLimits =
      { Type = { cpu : Optional Integer, memory : Optional Integer }
      , default = { cpu = None Integer, memory = None Integer }
      }

let Config
    : ∀(_params : { image_resource : Type }) →
        { Type : Type
        , default :
            { inputs : Optional (List Input.Type)
            , outputs : Optional (List Output.Type)
            , caches : Optional (List Cache.Type)
            , params : Optional (List { mapKey : Text, mapValue : Text })
            , rootfs_uri : Optional Text
            , container_limits : Optional ContainerLimits.Type
            }
        }
    = λ(_params : { image_resource : Type }) →
        { Type =
            { platform : Text
            , image_resource : _params.image_resource
            , inputs : Optional (List Input.Type)
            , outputs : Optional (List Output.Type)
            , caches : Optional (List Cache.Type)
            , params : Optional (List { mapKey : Text, mapValue : Text })
            , run : Run.Type
            , rootfs_uri : Optional Text
            , container_limits : Optional ContainerLimits.Type
            }
        , default =
          { inputs = None (List Input.Type)
          , outputs = None (List Output.Type)
          , caches = None (List Cache.Type)
          , params = None (List { mapKey : Text, mapValue : Text })
          , rootfs_uri = None Text
          , container_limits = None ContainerLimits.Type
          }
        }

let example =
      let RegistryImage = ./resource-types/RegistryImage.dhall

      let ImageResource =
            ImageResource
              { source = RegistryImage.Source.Type
              , get_params = <>
              , version = <>
              }

      let Config = Config { image_resource = ImageResource.Type }

      in  Config::{
          , platform = "linux"
          , image_resource = ImageResource::{
            , type = RegistryImage.meta.name
            , source = RegistryImage.Source::{ repository = "busybox" }
            }
          , params = Some (toMap { FOO = "hello" })
          , run = Run::{ path = "/bin/sh", args = Some [ "-ec", "echo \$FOO" ] }
          }

in  { ImageResource, Input, Output, Cache, Run, ContainerLimits, Config }
