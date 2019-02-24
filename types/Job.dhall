let Step = ./Step.dhall : Type

in    { name :
          Text
      , plan :
          List Step
      , serial :
          Optional Bool
      , build_logs_to_retain :
          Optional Natural
      , serial_groups :
          Optional (List Text)
      , max_in_flight :
          Optional Natural
      , public :
          Optional Bool
      , disable_manual_trigger :
          Optional Bool
      , interruptible :
          Optional Bool
      , on_success :
          Optional Step
      , on_failure :
          Optional Step
      , on_abort :
          Optional Step
      , ensure :
          Optional Step
      }
    : Type
