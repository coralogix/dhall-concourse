{ meta = { name = "github-status", repository = "resource/github-status" }
, Version = { Type = { `context@sha` : Text }, default = {=} }
, Params =
  { Get =
    { Type = { path : Text, context : Optional Text }
    , default.context = None Text
    }
  , Put =
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
            , StatusObject
            }

      let Status =
            { Type = { path : Text } ⩓ StatusObject.Type
            , default = StatusObject.default
            }

      let Put =
            let Put = < Status : Status.Type | Statuses : Statuses.Type >

            in  { Type = Put
                , Status = λ(status : Status.Type) → Put.Status status
                , Statuses = λ(statuses : Statuses.Type) → Put.Statuses statuses
                , Options = { Status, Statuses }
                }

      let test =
            Put.Status Put.Options.Status::{ path = "test", state = "successs" }

      in  Put
  }
, Source =
    let Source = { Type = { repo : Text, access_token : Text }, default = {=} }

    let test = Source::{ repo = "test", access_token = "my-token" }

    in  Source
}
