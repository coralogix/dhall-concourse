let
  nixpkgs = import (
    let
      version = "eca0d38e22981ba54f3185b1ff16a5e67d483776";
    in builtins.fetchTarball {
      name   = "nixpkgs-${version}";
      url    = "https://github.com/NixOS/nixpkgs/archive/${version}.tar.gz";
      sha256 = "162ip8l5x5v1wwkdq7xrhqc9155c5i294l7rl18r8skmrncjad12";
      }
    ) {};

  easy-dhall-nix = import (
    let
      version = "1.33.1";
    in nixpkgs.fetchFromGitHub {
      owner  = "justinwoo";
      repo   = "easy-dhall-nix";
      rev    = "288ee825c326f352a5db194a024bd3e1f2f735b2";
      sha256 = "12v4ql1nm1famz8r80k1xkkdgj7285vy2vn16iili0qwvz3i98ah";
      }
    ) {};

in nixpkgs.mkShell {
  buildInputs = [
    easy-dhall-nix.dhall-simple
    nixpkgs.gitAndTools.lefthook
  ];
}
