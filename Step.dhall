let HookParams =
      { on_success : Type
      , on_failure : Type
      , on_abort : Type
      , on_error : Type
      , ensure : Type
      }

let Hooks =
      λ(_params : HookParams) →
        { Type =
            { timeout : Optional Text
            , attempts : Optional Natural
            , tags : Optional (List Text)
            , on_success : Optional _params.on_success
            , on_failure : Optional _params.on_failure
            , on_abort : Optional _params.on_abort
            , on_error : Optional _params.on_error
            , ensure : Optional _params.ensure
            }
        , default =
          { timeout = None Text
          , attempts = None Natural
          , tags = None (List Text)
          , on_success = None _params.on_success
          , on_failure = None _params.on_failure
          , on_abort = None _params.on_abort
          , on_error = None _params.on_error
          , ensure = None _params.ensure
          }
        }

let Hookless =
      { on_success = <>
      , on_failure = <>
      , on_abort = <>
      , on_error = <>
      , ensure = <>
      }

let Get
    : ∀(_params : HookParams ⩓ { get_params : Type, version : Type }) →
        { Type : Type
        , default :
            { resource : Optional Text
            , passed : Optional (List Text)
            , params : Optional _params.get_params
            , trigger : Optional Bool
            , version : Optional _params.version
            , timeout : Optional Text
            , attempts : Optional Natural
            , tags : Optional (List Text)
            , on_success : Optional _params.on_success
            , on_failure : Optional _params.on_failure
            , on_abort : Optional _params.on_abort
            , on_error : Optional _params.on_error
            , ensure : Optional _params.ensure
            }
        }
    = λ(_params : HookParams ⩓ { get_params : Type, version : Type }) →
        let Hooks =
              Hooks
                _params.{ on_success, on_failure, on_abort, on_error, ensure }

        in  { Type =
                  { get : Text
                  , resource : Optional Text
                  , passed : Optional (List Text)
                  , params : Optional _params.get_params
                  , trigger : Optional Bool
                  , version : Optional _params.version
                  }
                ⩓ Hooks.Type
            , default =
                  { resource = None Text
                  , passed = None (List Text)
                  , params = None _params.get_params
                  , trigger = None Bool
                  , version = None _params.version
                  }
                ∧ Hooks.default
            }

let PutInputs = < all | detect | list : List Text >

let Put
    : ∀(_params : HookParams ⩓ { params : Type, get_params : Type }) →
        { Type : Type
        , Inputs : Type
        , default :
            { resource : Optional Text
            , inputs : Optional PutInputs
            , params : Optional _params.params
            , get_params : Optional _params.get_params
            , timeout : Optional Text
            , attempts : Optional Natural
            , tags : Optional (List Text)
            , on_success : Optional _params.on_success
            , on_failure : Optional _params.on_failure
            , on_abort : Optional _params.on_abort
            , on_error : Optional _params.on_error
            , ensure : Optional _params.ensure
            }
        }
    = λ(_params : HookParams ⩓ { params : Type, get_params : Type }) →
        let Hooks =
              Hooks
                _params.{ on_success, on_failure, on_abort, on_error, ensure }

        in  { Type =
                  { put : Text
                  , resource : Optional Text
                  , inputs : Optional PutInputs
                  , params : Optional _params.params
                  , get_params : Optional _params.get_params
                  }
                ⩓ Hooks.Type
            , Inputs = PutInputs
            , default =
                  { resource = None Text
                  , inputs = None PutInputs
                  , params = None _params.params
                  , get_params = None _params.get_params
                  }
                ∧ Hooks.default
            }

let Task
    : ∀(_params : HookParams ⩓ { config : Type }) →
        { Type : Type
        , default :
            { config : Optional _params.config
            , file : Optional Text
            , image : Optional Text
            , privileged : Optional Bool
            , vars : Optional (List { mapKey : Text, mapValue : Text })
            , params : Optional (List { mapKey : Text, mapValue : Text })
            , input_mapping : Optional (List { mapKey : Text, mapValue : Text })
            , output_mapping :
                Optional (List { mapKey : Text, mapValue : Text })
            , timeout : Optional Text
            , attempts : Optional Natural
            , tags : Optional (List Text)
            , on_success : Optional _params.on_success
            , on_failure : Optional _params.on_failure
            , on_abort : Optional _params.on_abort
            , on_error : Optional _params.on_error
            , ensure : Optional _params.ensure
            }
        }
    = λ(_params : HookParams ⩓ { config : Type }) →
        let Hooks =
              Hooks
                _params.{ on_success, on_failure, on_abort, on_error, ensure }

        in  { Type =
                  { task : Text
                  , config : Optional _params.config
                  , file : Optional Text
                  , image : Optional Text
                  , privileged : Optional Bool
                  , vars : Optional (List { mapKey : Text, mapValue : Text })
                  , params : Optional (List { mapKey : Text, mapValue : Text })
                  , input_mapping :
                      Optional (List { mapKey : Text, mapValue : Text })
                  , output_mapping :
                      Optional (List { mapKey : Text, mapValue : Text })
                  }
                ⩓ Hooks.Type
            , default =
                  { config = None _params.config
                  , file = None Text
                  , image = None Text
                  , privileged = None Bool
                  , vars = None (List { mapKey : Text, mapValue : Text })
                  , params = None (List { mapKey : Text, mapValue : Text })
                  , input_mapping =
                      None (List { mapKey : Text, mapValue : Text })
                  , output_mapping =
                      None (List { mapKey : Text, mapValue : Text })
                  }
                ∧ Hooks.default
            }

let SetPipeline
    : ∀(_params : HookParams) →
        { Type : Type
        , default :
            { file : Optional Text
            , vars : Optional (List { mapKey : Text, mapValue : Text })
            , var_files : Optional (List Text)
            , team : Optional Text
            , timeout : Optional Text
            , attempts : Optional Natural
            , tags : Optional (List Text)
            , on_success : Optional _params.on_success
            , on_failure : Optional _params.on_failure
            , on_abort : Optional _params.on_abort
            , on_error : Optional _params.on_error
            , ensure : Optional _params.ensure
            }
        }
    = λ(_params : HookParams) →
        let Hooks =
              Hooks
                _params.{ on_success, on_failure, on_abort, on_error, ensure }

        in  { Type =
                  { set_pipeline : Text
                  , file : Optional Text
                  , vars : Optional (List { mapKey : Text, mapValue : Text })
                  , var_files : Optional (List Text)
                  , team : Optional Text
                  }
                ⩓ Hooks.Type
            , default =
                  { file = None Text
                  , vars = None (List { mapKey : Text, mapValue : Text })
                  , var_files = None (List Text)
                  , team = None Text
                  }
                ∧ Hooks.default
            }

let LoadVarFormat = < detect | json | yaml | yml | raw >

let LoadVar
    : ∀(_params : HookParams) →
        { Type : Type
        , Format : Type
        , default :
            { format : Optional LoadVarFormat
            , reveal : Optional Bool
            , timeout : Optional Text
            , attempts : Optional Natural
            , tags : Optional (List Text)
            , on_success : Optional _params.on_success
            , on_failure : Optional _params.on_failure
            , on_abort : Optional _params.on_abort
            , on_error : Optional _params.on_error
            , ensure : Optional _params.ensure
            }
        }
    = λ(_params : HookParams) →
        let Hooks =
              Hooks
                _params.{ on_success, on_failure, on_abort, on_error, ensure }

        in  { Type =
                  { load_var : Text
                  , file : Text
                  , format : Optional LoadVarFormat
                  , reveal : Optional Bool
                  }
                ⩓ Hooks.Type
            , Format = LoadVarFormat
            , default =
                  { format = None LoadVarFormat, reveal = None Bool }
                ∧ Hooks.default
            }

let InParallel
    : ∀(_params : HookParams ⩓ { step : Type }) →
        { Type : Type
        , default :
            { limit : Optional Natural
            , fail_fast : Optional Bool
            , timeout : Optional Text
            , attempts : Optional Natural
            , tags : Optional (List Text)
            , on_success : Optional _params.on_success
            , on_failure : Optional _params.on_failure
            , on_abort : Optional _params.on_abort
            , on_error : Optional _params.on_error
            , ensure : Optional _params.ensure
            }
        }
    = λ(_params : HookParams ⩓ { step : Type }) →
        let Hooks =
              Hooks
                _params.{ on_success, on_failure, on_abort, on_error, ensure }

        in  { Type =
                  { steps : List _params.step
                  , limit : Optional Natural
                  , fail_fast : Optional Bool
                  }
                ⩓ Hooks.Type
            , default =
                { limit = None Natural, fail_fast = None Bool } ∧ Hooks.default
            }

let Do
    : ∀(_params : HookParams ⩓ { step : Type }) →
        { Type : Type
        , default :
            { timeout : Optional Text
            , attempts : Optional Natural
            , tags : Optional (List Text)
            , on_success : Optional _params.on_success
            , on_failure : Optional _params.on_failure
            , on_abort : Optional _params.on_abort
            , on_error : Optional _params.on_error
            , ensure : Optional _params.ensure
            }
        }
    = λ(_params : HookParams ⩓ { step : Type }) →
        let Hooks =
              Hooks
                _params.{ on_success, on_failure, on_abort, on_error, ensure }

        in  { Type = { do : List _params.step } ⩓ Hooks.Type
            , default = Hooks.default
            }

let Try
    : ∀(_params : HookParams ⩓ { step : Type }) →
        { Type : Type
        , default :
            { timeout : Optional Text
            , attempts : Optional Natural
            , tags : Optional (List Text)
            , on_success : Optional _params.on_success
            , on_failure : Optional _params.on_failure
            , on_abort : Optional _params.on_abort
            , on_error : Optional _params.on_error
            , ensure : Optional _params.ensure
            }
        }
    = λ(_params : HookParams ⩓ { step : Type }) →
        let Hooks =
              Hooks
                _params.{ on_success, on_failure, on_abort, on_error, ensure }

        in  { Type = { try : _params.step } ⩓ Hooks.Type
            , default = Hooks.default
            }

in  { Hookless, Get, Put, Task, SetPipeline, LoadVar, InParallel, Do, Try }
