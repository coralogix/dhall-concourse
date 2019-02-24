let Get = ./Step.Get.dhall : Type

let Put = ./Step.Put.dhall : Type

let Task = ./Step.Task.dhall : Type

in  < Get : Get | Put : Put | Task : Task > : Type
