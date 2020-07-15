{ meta =
  { name = "github-list-repos"
  , repository = "quay.io/coralogix/concourse-resource-github-list-repos"
  }
, Version = { Type = { hash : Text }, default = {=} }
, Params =
  { Get =
    { Type = { output_format : Optional Text }
    , default.output_format = None Text
    }
  , Put = { Type = {}, default = {=} }
  }
, Source =
    let Exclude =
          let Exclude =
                { Type =
                    { auth_token : Text
                    , org : Text
                    , team : Optional Text
                    , v4_endpoint : Optional Text
                    , exclude_regex : Optional Text
                    , exclude : Optional (List Text)
                    }
                , default =
                  { team = None Text
                  , v4_endpoint = None Text
                  , exclude_regex = None Text
                  , exclude = None (List Text)
                  }
                }

          let test = Exclude::{ auth_token = "test", org = "test" }

          in  Exclude

    let Include =
          let Include =
                { Type =
                    { auth_token : Text
                    , org : Text
                    , team : Optional Text
                    , v4_endpoint : Optional Text
                    , include_regex : Text
                    }
                , default = { team = None Text, v4_endpoint = None Text }
                }

          let test =
                Include::{
                , auth_token = "test"
                , org = "test"
                , include_regex = "test"
                }

          in  Include

    let Source = < Exclude : Exclude.Type | Include : Include.Type >

    in  { Type = Source
        , Exclude = λ(exclude : Exclude.Type) → Source.Exclude exclude
        , Include = λ(include : Include.Type) → Source.Include include
        , Options = { Exclude, Include }
        }
}
