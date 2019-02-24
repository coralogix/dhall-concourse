let Exclude =
        { auth_token :
            Text
        , org :
            Text
        , team :
            Optional Text
        , exclude_regex :
            Optional Text
        , exclude :
            Optional (List Text)
        }
      : Type

let Include =
        { auth_token :
            Text
        , org :
            Text
        , team :
            Optional Text
        , include_regex :
            Text
        }
      : Type

in  { version_schema =
        { hash : Text }
    , get_params =
        { output_format : Optional Text } : Type
    , put_params =
        {} : Type
    , source =
        < Exclude : Exclude | Include : Include > : Type
    , source_exclude =
        Exclude
    , source_include =
        Include
    }
