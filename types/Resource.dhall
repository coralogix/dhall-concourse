let Version = ./Version.dhall : Type

let ResourceSource = ./resources/_source.dhall : Type

in    { name :
          Text
      , type :
          Text
      , version :
          Optional Version
      , check_every :
          Optional Text
      , tags :
          Optional (List Text)
      , webhook_token :
          Optional Text
      , source :
          ResourceSource
      }
    : Type
