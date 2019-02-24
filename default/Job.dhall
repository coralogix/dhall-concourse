let Step = ../types/Step.dhall : Type

let Job = ../types/Job.dhall : Type

in    λ(_params : { name : Text, plan : List Step })
    →   { name =
            _params.name
        , plan =
            _params.plan
        , serial =
            None Bool
        , build_logs_to_retain =
            None Natural
        , serial_groups =
            None (List Text)
        , max_in_flight =
            None Natural
        , public =
            None Bool
        , disable_manual_trigger =
            None Bool
        , interruptible =
            None Bool
        , on_success =
            None Step
        , on_failure =
            None Step
        , on_abort =
            None Step
        , ensure =
            None Step
        }
      : Job
