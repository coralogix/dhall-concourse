let BuildLogRetentionPolicy =
      { Type =
          { days : Optional Natural
          , builds : Optional Natural
          , minimum_succeeded_builds : Optional Natural
          }
      , default =
        { days = None Natural
        , builds = None Natural
        , minimum_succeeded_builds = None Natural
        }
      }

let Job
    : ∀ ( _params
        : { plan : Type
          , on_success : Type
          , on_failure : Type
          , on_abort : Type
          , on_error : Type
          , ensure : Type
          }
        ) →
        { Type : Type
        , BuildLogRetentionPolicy :
            { Type : Type, default : BuildLogRetentionPolicy.Type }
        , default :
            { old_name : Optional Text
            , serial : Optional Bool
            , build_log_retention : Optional BuildLogRetentionPolicy.Type
            , build_logs_to_retain : Optional Natural
            , serial_groups : Optional (List Text)
            , max_in_flight : Optional Natural
            , public : Optional Bool
            , disable_manual_trigger : Optional Bool
            , interruptible : Optional Bool
            , on_success : Optional _params.on_success
            , on_failure : Optional _params.on_failure
            , on_abort : Optional _params.on_abort
            , on_error : Optional _params.on_error
            , ensure : Optional _params.ensure
            }
        }
    = λ ( _params
        : { plan : Type
          , on_success : Type
          , on_failure : Type
          , on_abort : Type
          , on_error : Type
          , ensure : Type
          }
        ) →
        { Type =
            { name : Text
            , plan : List _params.plan
            , old_name : Optional Text
            , serial : Optional Bool
            , build_log_retention : Optional BuildLogRetentionPolicy.Type
            , build_logs_to_retain : Optional Natural
            , serial_groups : Optional (List Text)
            , max_in_flight : Optional Natural
            , public : Optional Bool
            , disable_manual_trigger : Optional Bool
            , interruptible : Optional Bool
            , on_success : Optional _params.on_success
            , on_failure : Optional _params.on_failure
            , on_abort : Optional _params.on_abort
            , on_error : Optional _params.on_error
            , ensure : Optional _params.ensure
            }
        , default =
          { old_name = None Text
          , serial = None Bool
          , build_log_retention = None BuildLogRetentionPolicy.Type
          , build_logs_to_retain = None Natural
          , serial_groups = None (List Text)
          , max_in_flight = None Natural
          , public = None Bool
          , disable_manual_trigger = None Bool
          , interruptible = None Bool
          , on_success = None _params.on_success
          , on_failure = None _params.on_failure
          , on_abort = None _params.on_abort
          , on_error = None _params.on_error
          , ensure = None _params.ensure
          }
        , BuildLogRetentionPolicy
        }

in  Job
