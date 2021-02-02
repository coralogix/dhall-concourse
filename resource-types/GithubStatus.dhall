{ meta = { name = "github-status", repository = "resource/github-status" }
, Version = { Type = {}, default = {=} }
, Params =
  { Get =
    { Type = { path : Text, context : Optional Text }
    , default.context = None Text
    }
  , Put =
    { Type =
        let StatusObject =
              { Type =
                  { state : Text
                  , context : Optional Text
                  , description : Optional Text
                  , target_url : Optional Text
                  }
              , default =
                { context = None Text
                , description = None Text
                , target_url = None Text
                }
              }

        let Statuses =
              { Type = { path : Text, statuses : List StatusObject.Type }
              , default = {=}
              }

        let Status =
              { Type = { path : Text } ⩓ StatusObject.Type
              , default =
                { context = None Text
                , description = None Text
                , target_url = None Text
                }
              }

        in  { Type = < Status : Status.Type | Statuses : Statuses.Type >
            , StatusObject
            , Statuses
            }
    , default = {=}
    }
  }
, Source =
    let Source = { Type = { repo : Text, access_token : Text }, default = {=} }

    let test = Source::{ repo = "test", access_token = "my-token" }

    in  Source
}
