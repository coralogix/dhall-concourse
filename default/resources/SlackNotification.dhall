let SlackNotification = ../../types/resources/SlackNotification.dhall

let ResourceType = ../../types/ResourceType.dhall

let mkResourceType = ../ResourceType.dhall

let name = "slack-notification"

let repository = "cfcommunity/slack-notification-resource"

in  { version =
        {=} : SlackNotification.version.schema
    , params =
        { get =
            {=} : SlackNotification.params.get.schema
        , put =
              { text =
                  None Text
              , text_file =
                  None Text
              , attachments =
                  None (List SlackNotification.params.put.attachment.schema)
              , attachments_file =
                  None Text
              , channel =
                  None Text
              , channel_file =
                  None Text
              , env_file =
                  None Text
              , username =
                  None Text
              , icon_url =
                  None Text
              , icon_emoji =
                  None Text
              , silent =
                  None Bool
              , always_notify =
                  None Bool
              }
            : SlackNotification.params.put.schema
        , attachment =
              λ(_params : { fallback : Text, text : Text })
            →   { fallback =
                    _params.fallback
                , color =
                    None Text
                , pretext =
                    None Text
                , author_name =
                    None Text
                , author_link =
                    None Text
                , author_icon =
                    None Text
                , title =
                    None Text
                , title_link =
                    None Text
                , text =
                    _params.text
                , fields =
                    None
                    (List { title : Text, value : Text, short : Optional Bool })
                , image_url =
                    None Text
                , thumb_url =
                    None Text
                , footer =
                    None Text
                , footer_icon =
                    None Text
                , ts =
                    None Natural
                }
              : SlackNotification.params.put.attachment.schema
        }
    , source =
          λ(_params : { url : Text })
        →   { url =
                _params.url
            , insecure =
                None Bool
            , proxy =
                None Text
            , proxy_https_tunnel =
                None Bool
            , disable =
                None Bool
            , ca_certs =
                None (List { domain : Text, cert : Text })
            }
          : SlackNotification.source.schema
    , meta =
        { name =
            name
        , repository =
            repository
        , resource_type =
              mkResourceType.DockerImage
              { name = name, repository = repository }
            : ResourceType
        }
    }
