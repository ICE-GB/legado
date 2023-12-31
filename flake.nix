{
  description = "My Personal NixOS Configuration";

  nixConfig = {};

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-parts,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];
      imports = [
      ];
      perSystem = {
        config,
        inputs',
        pkgs,
        system,
        lib,
        ...
      }: {
        devShells = {
          #run by `nix devlop` or `nix-shell`(legacy)
          #Temporarily enable experimental features, run by`nix develop --extra-experimental-features nix-command --extra-experimental-features flakes`
          default = pkgs.mkShell {
            nativeBuildInputs = with pkgs; [
              git
              jdk17
              jdk21
              maven
              gradle
              gh
            ];
            inputsFrom = [
            ];
          };
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-compat = {
      url = "github:inclyc/flake-compat";
      flake = false;
    };
  };
}
