let Get = ./Step.Hook.Step.Get.dhall : Type

let Put = ./Step.Hook.Step.Put.dhall : Type

let Task = ./Step.Hook.Step.Task.dhall : Type

in  < Get : Get | Put : Put | Task : Task > : Type
