{ meta =
  { name = "git-multibranch"
  , repository = "cfcommunity/git-multibranch-resource"
  }
, Version = { Type = { ref : Text }, default = {=} }
, Params =
  { Get =
      let Submodules = < Text : Text | List : List Text >

      let Get =
            { Type =
                { depth : Optional Natural, submodules : Optional Submodules }
            , default = { depth = None Natural, submodules = None Submodules }
            , Submodules
            }

      let test = Get::{=}

      in  Get
  , Put =
      let Put =
            { Type =
                { repository : Text
                , rebase : Optional Bool
                , tag : Optional Text
                , only_tag : Optional Bool
                , tag_prefix : Optional Text
                }
            , default =
              { rebase = None Bool
              , tag = None Text
              , only_tag = None Bool
              , tag_prefix = None Text
              }
            }

      let test = Put::{ repository = "test" }

      in  Put
  }
, Source =
    let Redis =
          let Redis =
                { Type =
                    { host : Text
                    , password : Optional Text
                    , prefix : Optional Text
                    , db_number : Optional Natural
                    }
                , default =
                  { password = None Text
                  , prefix = None Text
                  , db_number = None Natural
                  }
                }

          let test = Redis::{ host = "test" }

          in  Redis

    let Source =
          { Type =
              { uri : Text
              , branch : Optional Text
              , private_key : Optional Text
              , paths : Optional (List Text)
              , ignore_paths : Optional (List Text)
              , skip_ssl_verification : Optional Bool
              , branches : Optional Text
              , ignore_branches : Optional Text
              , redis : Optional Redis.Type
              }
          , default =
            { branch = None Text
            , private_key = None Text
            , paths = None (List Text)
            , ignore_paths = None (List Text)
            , skip_ssl_verification = None Bool
            , branches = None Text
            , ignore_branches = None Text
            , redis = None Redis.Type
            }
          , Redis
          }

    let test = Source::{ uri = "test" }

    in  Source
}
