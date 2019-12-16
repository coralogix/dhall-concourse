let StepBox = ./Step.Box.dhall : Type

in    { name : Text
      , plan : List StepBox
      , serial : Optional Bool
      , build_logs_to_retain : Optional Natural
      , serial_groups : Optional (List Text)
      , max_in_flight : Optional Natural
      , public : Optional Bool
      , disable_manual_trigger : Optional Bool
      , interruptible : Optional Bool
      , on_success : Optional StepBox
      , on_failure : Optional StepBox
      , on_abort : Optional StepBox
      , ensure : Optional StepBox
      }
    : Type
