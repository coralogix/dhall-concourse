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

in  { version =
        { schema = { hash : Text } }
    , params =
        { get =
            { schema = { output_format : Optional Text } : Type }
        , put =
            { schema = {} : Type }
        }
    , source =
        { schema =
            < Exclude : Exclude | Include : Include > : Type
        , exclude =
            { schema = Exclude }
        , include =
            { schema = Include }
        }
    }
