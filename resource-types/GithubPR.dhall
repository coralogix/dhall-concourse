{ meta = { name = "pull-request", repository = "teliaoss/github-pr-resource" }
, Version =
  { Type = { pr : Text, commit : Text, committed : Optional Text }
  , default.committed = None Text
  }
, Params =
  { Get =
      let Get =
            { Type =
                { skip_download : Optional Bool
                , integration_tool : Optional Text
                , git_depth : Optional Natural
                , submodules : Optional Bool
                , list_changed_files : Optional Bool
                }
            , default =
              { skip_download = None Bool
              , integration_tool = None Text
              , git_depth = None Natural
              , submodules = None Bool
              , list_changed_files = None Bool
              }
            }

      let test = Get::{=}

      in  Get
  , Put =
      let Put =
            { Type =
                { path : Text
                , status : Optional Text
                , base_context : Optional Text
                , context : Optional Text
                , comment : Optional Text
                , comment_file : Optional Text
                , target_url : Optional Text
                , description : Optional Text
                , description_file : Optional Text
                , delete_previous_comments : Optional Bool
                }
            , default =
              { status = None Text
              , base_context = None Text
              , context = None Text
              , comment = None Text
              , comment_file = None Text
              , target_url = None Text
              , description = None Text
              , description_file = None Text
              , delete_previous_comments = None Bool
              }
            }

      let test = Put::{ path = "test" }

      in  Put
  }
, Source =
    let Source =
          { Type =
              { repository : Text
              , access_token : Text
              , v3_endpoint : Optional Text
              , v4_endpoint : Optional Text
              , paths : Optional (List Text)
              , ignore_paths : Optional (List Text)
              , disable_ci_skip : Optional Bool
              , skip_ssl_verification : Optional Bool
              , disable_forks : Optional Bool
              , required_review_approvals : Optional Natural
              , git_crypt_key : Optional Text
              , base_branch : Optional Text
              , labels : Optional (List Text)
              }
          , default =
            { repository = Text
            , access_token = Text
            , v3_endpoint = None Text
            , v4_endpoint = None Text
            , paths = None (List Text)
            , ignore_paths = None (List Text)
            , disable_ci_skip = None Bool
            , skip_ssl_verification = None Bool
            , disable_forks = None Bool
            , required_review_approvals = None Natural
            , git_crypt_key = None Text
            , base_branch = None Text
            , labels = None (List Text)
            }
          }

    let test = Source::{ repository = "test", access_token = "test" }

    in  Source
}
