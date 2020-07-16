{ meta =
  { name = "dhall"
  , repository = "quay.io/coralogix/eng-concourse-resource-dhall"
  }
, Version = { Type = { hash : Text }, default = {=} }
, Params =
  { Get = { Type = {}, default = {=} }, Put = { Type = {}, default = {=} } }
, Source =
    let Source =
          { Type =
              { expression : Text
              , ascii : Optional Bool
              , censor : Optional Bool
              , explain : Optional Bool
              , environment_variables :
                  Optional (List { mapKey : Text, mapValue : Text })
              }
          , default =
            { ascii = None Bool
            , censor = None Bool
            , explain = None Bool
            , environment_variables =
                None (List { mapKey : Text, mapValue : Text })
            }
          }

    let test = Source::{ expression = "test" }

    in  Source
}
