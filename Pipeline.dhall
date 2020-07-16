let Group = ./Group.dhall

let Pipeline
    : ∀ ( _params
        : { job : Type
          , resource : Type
          , resource_type : Type
          , var_source : Type
          }
        ) →
        { Type : Type
        , default :
            { jobs : Optional (List _params.job)
            , resources : Optional (List _params.resource)
            , resource_types : Optional (List _params.resource_type)
            , var_sources : Optional (List _params.var_source)
            , groups : Optional Group.Type
            }
        }
    = λ ( _params
        : { job : Type
          , resource : Type
          , resource_type : Type
          , var_source : Type
          }
        ) →
        { Type =
            { jobs : Optional (List _params.job)
            , resources : Optional (List _params.resource)
            , resource_types : Optional (List _params.resource_type)
            , var_sources : Optional (List _params.var_source)
            , groups : Optional Group.Type
            }
        , default =
          { jobs = None (List _params.job)
          , resources = None (List _params.resource)
          , resource_types = None (List _params.resource_type)
          , var_sources = None (List _params.var_source)
          , groups = None Group.Type
          }
        }

in  Pipeline
