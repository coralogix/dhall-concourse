{ meta =
  { name = "coralogix-event"
  , repository = "quay.io/coralogix/eng-coralogix-event-resource"
  }
, Version = { Type = {}, default = {=} }
, Params =
  { Get = { Type = {}, default = {=} }
  , Put =
      let Put =
            { Type =
                { build_status : Text
                , severity : Optional Text
                , message : Optional Text
                , labels : Optional (List { mapKey : Text, mapValue : Text })
                , additional_details_file : Optional Text
                , dry_mode : Optional Bool
                }
            , default =
              { severity = None Text
              , message = None Text
              , labels = None (List { mapKey : Text, mapValue : Text })
              , additional_details_file = None Text
              , dry_mode = None Bool
              }
            }

      let test = Put::{ build_status = "mock_build_status" }

      in  Put
  }
, Source =
    let Source =
          { Type =
              { private_key : Text
              , application_name : Optional Text
              , subsystem_name : Optional Text
              , coralogix_host : Optional Text
              , concourse_url : Optional Text
              }
          , default =
            { application_name = None Text
            , subsystem_name = None Text
            , coralogix_host = None Text
            , concourse_url = None Text
            }
          }

    let test = Source::{ private_key = "mock_private_key" }

    in  Source
}
