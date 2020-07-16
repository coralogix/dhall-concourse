let Step = ../types/Step.Hook.Step.dhall

in  λ(steps : List Step) → { aggregate = steps }
