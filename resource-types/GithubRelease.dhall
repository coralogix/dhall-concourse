{ meta =
  { name = "github-release", repository = "concourse/github-release-resource" }
, Version =
  { Type =
      { id : Optional Text, timestamp : Optional Text, tag : Optional Text }
  , default = { id = None Text, timestamp = None Text, tag = None Text }
  }
, Params =
  { Get =
      let Get =
            { Type =
                { globs : Optional (List Text)
                , include_source_tarball : Optional Bool
                , include_source_zip : Optional Bool
                }
            , default =
              { globs = None (List Text)
              , include_source_tarball = None Bool
              , include_source_zip = None Bool
              }
            }

      let test = Get::{=}

      in  Get
  , Put =
      let Put =
            { Type =
                { name : Text
                , tag : Text
                , tag_prefix : Optional Text
                , commitish : Optional Text
                , body : Optional Text
                , globs : Optional (List Text)
                }
            , default =
              { tag_prefix = None Text
              , commitish = None Text
              , body = None Text
              , globs = None (List Text)
              }
            }

      let test = Put::{ name = "test", tag = "0.1.0" }

      in  Put
  }
, Source =
    let Source =
          { Type =
              { owner : Text
              , repository : Text
              , access_token : Optional Text
              , github_api_url : Optional Text
              , github_uploads_url : Optional Text
              , insecure : Optional Bool
              , release : Optional Bool
              , pre_release : Optional Bool
              , drafts : Optional Bool
              , tag_filter : Optional Text
              , order_by : Optional Text
              }
          , default =
            { access_token = None Text
            , github_api_url = None Text
            , github_uploads_url = None Text
            , insecure = None Bool
            , release = None Bool
            , pre_release = None Bool
            , drafts = None Bool
            , tag_filter = None Text
            , order_by = None Text
            }
          }

    let test = Source::{ repository = "test", owner = "test" }

    in  Source
}
