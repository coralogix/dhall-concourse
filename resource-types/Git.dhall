{ meta = { name = "git", repository = "concourse/git-resource" }
, Version = { Type = { ref : Text }, default = {=} }
, Params =
  { Get =
      let Submodules = < Text : Text | List : List Text >

      let Get =
            { Type =
                { depth : Optional Natural
                , fetch_tags : Optional Bool
                , submodules : Optional Submodules
                , submodule_recursive : Optional Bool
                , submodule_remote : Optional Bool
                , disable_git_lfs : Optional Bool
                , clean_tags : Optional Bool
                , short_ref_format : Optional Text
                , describe_ref_options : Optional Text
                }
            , default =
              { depth = None Natural
              , fetch_tags = None Bool
              , submodules = None Submodules
              , submodule_recursive = None Bool
              , submodule_remote = None Bool
              , disable_git_lfs = None Bool
              , clean_tags = None Bool
              , short_ref_format = None Text
              , describe_ref_options = None Text
              }
            , Submodules
            }

      let test = Get::{=}

      in  Get
  , Put =
      let Put =
            { Type =
                { repository : Text
                , rebase : Optional Bool
                , `merge` : Optional Bool
                , returning : Optional Text
                , tag : Optional Text
                , only_tag : Optional Bool
                , tag_prefix : Optional Text
                , force : Optional Bool
                , annotate : Optional Text
                , notes : Optional Text
                }
            , default =
              { rebase = None Bool
              , `merge` = None Bool
              , returning = None Text
              , tag = None Text
              , only_tag = None Bool
              , tag_prefix = None Text
              , force = None Bool
              , annotate = None Text
              , notes = None Text
              }
            }

      let test = Put::{ repository = "test" }

      in  Put
  }
, Source =
    let SubmoduleCredential =
          { Type = { host : Text, username : Text, password : Text }
          , default = {=}
          }

    let HttpsTunnel =
          let HttpsTunnel =
                { Type =
                    { proxy_host : Text
                    , proxy_port : Text
                    , proxy_user : Optional Text
                    , proxy_password : Optional Text
                    }
                , default =
                  { proxy_user = None Text, proxy_password = None Text }
                }

          let test = HttpsTunnel::{ proxy_host = "test", proxy_port = "test" }

          in  HttpsTunnel

    let CommitFilter =
          let CommitFilter =
                { Type =
                    { exclude : Optional (List Text)
                    , include : Optional (List Text)
                    }
                , default =
                  { exclude = None (List Text), include = None (List Text) }
                }

          let test = CommitFilter::{=}

          in  CommitFilter

    let Source =
          { Type =
              { uri : Text
              , branch : Optional Text
              , private_key : Optional Text
              , forward_agent : Optional Bool
              , username : Optional Text
              , password : Optional Text
              , paths : Optional (List Text)
              , ignore_paths : Optional (List Text)
              , skip_ssl_verification : Optional Bool
              , tag_filter : Optional Text
              , fetch_tags : Optional Bool
              , submodule_credentials : Optional (List SubmoduleCredential.Type)
              , git_config : Optional (List { mapKey : Text, mapValue : Text })
              , disable_ci_skip : Optional Bool
              , commit_verification_keys : Optional (List Text)
              , commit_verification_key_ids : Optional (List Text)
              , gpg_keyserver : Optional Text
              , git_crypt_key : Optional Text
              , https_tunnel : Optional HttpsTunnel.Type
              , commit_filter : Optional CommitFilter.Type
              }
          , default =
            { branch = None Text
            , private_key = None Text
            , forward_agent = None Bool
            , username = None Text
            , password = None Text
            , paths = None (List Text)
            , ignore_paths = None (List Text)
            , skip_ssl_verification = None Bool
            , tag_filter = None Text
            , fetch_tags = None Bool
            , submodule_credentials = None (List SubmoduleCredential.Type)
            , git_config = None (List { mapKey : Text, mapValue : Text })
            , disable_ci_skip = None Bool
            , commit_verification_keys = None (List Text)
            , commit_verification_key_ids = None (List Text)
            , gpg_keyserver = None Text
            , git_crypt_key = None Text
            , https_tunnel = None HttpsTunnel.Type
            , commit_filter = None CommitFilter.Type
            }
          , SubmoduleCredential
          , HttpsTunnel
          , CommitFilter
          }

    let test = Source::{ uri = "test" }

    in  Source
}
