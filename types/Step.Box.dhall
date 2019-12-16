let Step = ./Step.dhall

let Get = ./Step.Get.dhall

let Task = ./Step.Task.dhall

let Put = ./Step.Put.dhall

let Do = { do : List Step }

let Aggregate = { aggregate : List Step }

let Try = { try : Step }

in  < Do : Do
    | Aggregate : Aggregate
    | Try : Try
    | Get : Get
    | Task : Task
    | Put : Put
    >
