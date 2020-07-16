{ meta =
  { name = "concourse-pipeline"
  , repository = "concourse/concourse-pipeline-resource"
  }
, Version = { Type = { mapKey : Text, mapValue : Text }, default = {=} }
, Params =
  { Get = { Type = {}, default = {=} }
  , Put =
      let Dynamic = { Type = { pipelines_file : Text }, default = {=} }

      let Static =
            let Pipeline =
                  let Pipeline =
                        { Type =
                            { name : Text
                            , team : Text
                            , config_file : Text
                            , vars_files : Optional (List Text)
                            , unpaused : Optional Bool
                            }
                        , default =
                          { vars_files = None (List Text)
                          , unpaused = None Bool
                          }
                        }

                  let test =
                        Pipeline::{
                        , name = "test"
                        , team = "test"
                        , config_file = "test"
                        }

                  in  Pipeline

            in  { Type = { pipelines : List Pipeline.Type }
                , default = {=}
                , Pipeline
                }

      let Put = < Dynamic : Dynamic.Type | Static : Static.Type >

      in  { Type = Put
          , Dynamic = λ(dynamic : Dynamic.Type) → Put.Dynamic dynamic
          , Static = λ(static : Static.Type) → Put.Static static
          , Options = { Dynamic, Static }
          }
  }
, Source =
    let Team =
          let Team =
                { Type =
                    { name : Text
                    , username : Optional Text
                    , password : Optional Text
                    }
                , default = { username = None Text, password = None Text }
                }

          let test = Team::{ name = "test" }

          in  Team

    let Source =
          { Type =
              { target : Optional Text
              , insecure : Optional Bool
              , teams : List Team.Type
              }
          , default = { target = None Text, insecure = None Bool }
          , Team
          }

    let test = Source::{ teams = [] : List Team.Type }

    in  Source
}
