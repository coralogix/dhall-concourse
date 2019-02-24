let Dynamic = { pipelines_file : Text } : Type

let StaticPipeline =
        { name :
            Text
        , team :
            Text
        , config_file :
            Text
        , vars_files :
            Optional (List Text)
        , unpaused :
            Optional Bool
        }
      : Type

let Static = { pipelines : List StaticPipeline } : Type

let Team =
      { name : Text, username : Optional Text, password : Optional Text } : Type

in  { version_schema =
        { mapKey : Text, mapValue : Text }
    , get_params =
        {} : Type
    , put_params =
        < Dynamic : Dynamic | Static : Static > : Type
    , put_params_dynamic =
        Dynamic
    , put_params_static =
        Static
    , put_params_static_pipeline =
        StaticPipeline
    , source =
        { target : Optional Text, insecure : Optional Bool, teams : List Team }
    , source_team =
        Team
    }
