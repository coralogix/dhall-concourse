let Step = ./Step.Hook.Step.dhall

let Get = ./Step.Hook.Step.Get.dhall

let Task = ./Step.Hook.Step.Task.dhall

let Put = ./Step.Hook.Step.Put.dhall

let Do = { do : List Step }

let Aggregate = { aggregate : List Step }

let Try = { try : Step }

in  < Do :
        Do
    | Aggregate :
        Aggregate
    | Try :
        Try
    | Get :
        Get
    | Task :
        Task
    | Put :
        Put
    >
