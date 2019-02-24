let SlackNotification = ../../types/resources/SlackNotification.dhall

let ResourceType = ../../types/ResourceType.dhall

let mkResourceType = ../ResourceType.dhall

let name = "slack-notification"

in  { params =
        { get =
            {=} : SlackNotification.get_params
        , put =
              { text =
                  None Text
              , text_file =
                  None Text
              , attachments =
                  None (List SlackNotification.attachment)
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
            : SlackNotification.put_params
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
              : SlackNotification.attachment
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
          : SlackNotification.source
    , meta =
        { name =
            name
        , resource_type =
              mkResourceType.DockerImage
              { name =
                  name
              , repository =
                  "cfcommunity/slack-notification-resource"
              }
            : ResourceType
        }
    }
