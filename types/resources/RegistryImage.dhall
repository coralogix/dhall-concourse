{ version = { schema = { digest : Text } }
, params =
    { get = { schema = { format : Optional Text } : Type }
    , put =
        { schema = { image : Text, additional_tags : Optional Text } : Type }
    }
, source =
    { schema =
          { repository : Text
          , tag : Optional Text
          , username : Optional Text
          , password : Optional Text
          , debug : Optional Bool
          }
        : Type
    }
}
