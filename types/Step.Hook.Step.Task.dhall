let Config = ./Step.Hook.Step.Task.Config.dhall : Type

in    { task : Text
      , config : Optional Config
      , file : Optional Text
      , privileged : Optional Bool
      , params : Optional (List { mapKey : Text, mapValue : Text })
      , image : Optional Text
      , input_mapping : Optional (List { mapKey : Text, mapValue : Text })
      , output_mapping : Optional (List { mapKey : Text, mapValue : Text })
      }
    : Type
