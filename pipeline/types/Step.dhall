let Version = ./Version.dhall

let ResourceDefinition = ./ResourceDefinition.dhall

let mkTaskImageResource =
        λ(resource : ResourceDefinition)
      →   { type :
              Text
          , params :
              Optional resource.get_params
          , version :
              Optional (Version resource.version_schema)
          , source :
              resource.source
          }
        : Type

let mkGet =
        λ(resource : ResourceDefinition)
      → (λ(Step : Type)
      →   { get :
              Text
          , resource :
              Optional Text
          , version :
              Optional (Version resource.version_schema)
          , passed :
              Optional (List Text)
          , params :
              Optional resource.get_params
          , trigger :
              Optional Bool
          , on_success :
              Optional Step
          , on_failure :
              Optional Step
          , on_abort :
              Optional Step
          , ensure :
              Optional Step
          }
        : Type)

let mkPut =
        λ(resource : ResourceDefinition)
      → (λ(Step : Type)
      →   { put :
              Text
          , resource :
              Optional Text
          , params :
              Optional resource.put_params
          , get_params :
              Optional resource.get_params
          , on_success :
              Optional Step
          , on_failure :
              Optional Step
          , on_abort :
              Optional Step
          , ensure :
              Optional Step
          }
        : Type)

let TaskImageResource =
      < DockerImage :
          mkTaskImageResource ../../resources/types/DockerImage.dhall
      >

let Get = < DockerImage : mkGet ../../resources/types/DockerImage.dhall >

let Put = < DockerImage : mkPut ../../resources/types/DockerImage.dhall >

let TaskConfig =
        { platform :
            Text
        , image_resource :
            Optional (∀(image : ResourceDefinition) → TaskImageResource image)
        , inputs :
            Optional
            ( List
              { name : Text, path : Optional Text, optional : Optional Bool }
            )
        , run :
            { path :
                Text
            , args :
                Optional (List Text)
            , dir :
                Optional Text
            , user :
                Optional Text
            }
        , rootfs_uri :
            Optional Text
        , outputs :
            Optional (List { name : Text, path : Optional Text })
        , caches :
            Optional (List { path : Text })
        , params :
            Optional (List { mapKey : Text, mapValue : Text })
        }
      : Type

let Task =
        λ(Step : Type)
      →   { task :
              Text
          , config :
              Optional TaskConfig
          , file :
              Optional Text
          , privileged :
              Optional Bool
          , params :
              Optional (List { mapKey : Text, mapValue : Text })
          , image :
              Optional Text
          , input_mapping :
              Optional (List { mapKey : Text, mapValue : Text })
          , output_mapping :
              Optional (List { mapKey : Text, mapValue : Text })
          , on_success :
              Optional Step
          , on_failure :
              Optional Step
          , on_abort :
              Optional Step
          , ensure :
              Optional Step
          }
        : Type

let Step =
        ∀(Step : Type)
      → ∀(Make : < Get : Get Step | Put : Put Step | Task : Task Step > → Step)
      → Step : Type

in  { Step =
        Step
    , Get =
        Get Step
    , Put =
        Put Step
    , Task =
        Task Step
    , TaskConfig =
        TaskConfig
    , TaskImageResource =
        TaskImageResource
    }
