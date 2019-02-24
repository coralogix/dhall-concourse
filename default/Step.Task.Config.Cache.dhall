let TaskConfigCache = ../types/Step.Task.Config.Cache.dhall : Type

in  λ(_params : { path : Text }) → { path = _params.path } : TaskConfigCache
