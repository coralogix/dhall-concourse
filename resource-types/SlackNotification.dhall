{ meta =
  { name = "slack-notification"
  , repository = "cfcommunity/slack-notification-resource"
  }
, Version = { Type = {}, default = {=} }
, Params =
  { Get = { Type = {}, default = {=} }
  , Put =
      let Attachment =
            let Field =
                  let Field =
                        { Type =
                            { title : Optional Text
                            , value : Optional Text
                            , short : Optional Bool
                            }
                        , default =
                          { title = None Text
                          , value = None Text
                          , short = None Bool
                          }
                        }

                  let test = Field::{=}

                  in  Field

            let Attachment =
                  { Type =
                      { fallback : Optional Text
                      , color : Optional Text
                      , pretext : Optional Text
                      , author_name : Optional Text
                      , author_link : Optional Text
                      , author_icon : Optional Text
                      , title : Optional Text
                      , title_link : Optional Text
                      , text : Optional Text
                      , fields : Optional (List Field.Type)
                      , mrkdwn_in : Optional (List Text)
                      , image_url : Optional Text
                      , thumb_url : Optional Text
                      , footer : Optional Text
                      , footer_icon : Optional Text
                      , ts : Optional Natural
                      }
                  , default =
                    { fallback = None Text
                    , color = None Text
                    , pretext = None Text
                    , author_name = None Text
                    , author_link = None Text
                    , author_icon = None Text
                    , title = None Text
                    , title_link = None Text
                    , text = None Text
                    , fields = None (List Field.Type)
                    , mrkdwn_in = None (List Text)
                    , image_url = None Text
                    , thumb_url = None Text
                    , footer = None Text
                    , footer_icon = None Text
                    , ts = None Natural
                    }
                  , Field
                  }

            let test = Attachment::{=}

            in  Attachment

      let Put =
            { Type =
                { text : Optional Text
                , text_file : Optional Text
                , attachments : Optional (List Attachment.Type)
                , attachments_file : Optional Text
                , channel : Optional Text
                , channel_file : Optional Text
                , env_file : Optional Text
                , username : Optional Text
                , icon_url : Optional Text
                , icon_emoji : Optional Text
                , silent : Optional Bool
                , always_notify : Optional Bool
                }
            , default =
              { text = None Text
              , text_file = None Text
              , attachments = None (List Attachment.Type)
              , attachments_file = None Text
              , channel = None Text
              , channel_file = None Text
              , env_file = None Text
              , username = None Text
              , icon_url = None Text
              , icon_emoji = None Text
              , silent = None Bool
              , always_notify = None Bool
              }
            , Attachment
            }

      let test = Put::{=}

      in  Put
  }
, Source =
    let CaCert = { Type = { domain : Text, cert : Text }, default = {=} }

    in  { Type =
            { url : Text
            , insecure : Optional Bool
            , proxy : Optional Text
            , proxy_https_tunnel : Optional Bool
            , disable : Optional Bool
            , ca_certs : Optional (List CaCert.Type)
            }
        , default =
          { insecure = None Bool
          , proxy = None Text
          , proxy_https_tunnel = None Bool
          , disable = None Bool
          , ca_certs = None (List CaCert.Type)
          }
        }
}
