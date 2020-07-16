let VarSource
    : ∀(_params : { config : Type }) → { Type : Type, default : {} }
    = λ(_params : { config : Type }) →
        { Type = { name : Text, type : Text, config : _params.config }
        , default = {=}
        }

in  VarSource
