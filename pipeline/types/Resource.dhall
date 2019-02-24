let mkResource = ./mkResource.dhall

in  < DockerImage : mkResource ../../resources/types/DockerImage.dhall > : Type
