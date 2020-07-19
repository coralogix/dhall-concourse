{ meta = { name = "time", repository = "concourse/time-resource" }
, Version = { Type = { time : Text }, default = {=} }
, Params =
  { Get = { Type = {}, default = {=} }, Put = { Type = {}, default = {=} } }
, Source =
    let Source =
          { Type =
              { interval : Optional Text
              , location : Optional Text
              , start : Optional Text
              , stop : Optional Text
              , days : Optional (List Text)
              }
          , default =
            { interval = None Text
            , location = None Text
            , start = None Text
            , stop = None Text
            , days = None (List Text)
            }
          }

    let test = Source::{=}

    in  Source
}
