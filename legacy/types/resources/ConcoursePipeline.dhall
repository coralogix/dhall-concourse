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

in  { version =
        { schema = { mapKey : Text, mapValue : Text } }
    , params =
        { get =
            { schema = {} : Type }
        , put =
            { schema =
                < Dynamic : Dynamic | Static : Static > : Type
            , dynamic =
                { schema = Dynamic }
            , static =
                { schema = Static, pipeline = { schema = StaticPipeline } }
            }
        }
    , source =
        { schema =
            { target :
                Optional Text
            , insecure :
                Optional Bool
            , teams :
                List Team
            }
        , team =
            { schema = Team }
        }
    }
