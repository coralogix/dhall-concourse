let Attachment =
        { fallback :
            Text
        , color :
            Optional Text
        , pretext :
            Optional Text
        , author_name :
            Optional Text
        , author_link :
            Optional Text
        , author_icon :
            Optional Text
        , title :
            Optional Text
        , title_link :
            Optional Text
        , text :
            Text
        , fields :
            Optional
            (List { title : Text, value : Text, short : Optional Bool })
        , image_url :
            Optional Text
        , thumb_url :
            Optional Text
        , footer :
            Optional Text
        , footer_icon :
            Optional Text
        , ts :
            Optional Natural
        }
      : Type

in  { version =
        { schema = {} : Type }
    , params =
        { get =
            { schema = {} : Type }
        , put =
            { schema =
                  { text :
                      Optional Text
                  , text_file :
                      Optional Text
                  , attachments :
                      Optional (List Attachment)
                  , attachments_file :
                      Optional Text
                  , channel :
                      Optional Text
                  , channel_file :
                      Optional Text
                  , env_file :
                      Optional Text
                  , username :
                      Optional Text
                  , icon_url :
                      Optional Text
                  , icon_emoji :
                      Optional Text
                  , silent :
                      Optional Bool
                  , always_notify :
                      Optional Bool
                  }
                : Type
            , attachment =
                { schema = Attachment : Type }
            }
        }
    , source =
        { schema =
              { url :
                  Text
              , insecure :
                  Optional Bool
              , proxy :
                  Optional Text
              , proxy_https_tunnel :
                  Optional Bool
              , disable :
                  Optional Bool
              , ca_certs :
                  Optional (List { domain : Text, cert : Text })
              }
            : Type
        }
    }
