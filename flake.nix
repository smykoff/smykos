{
  description = "SmykOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    agenix.url = "github:ryantm/agenix";
  };

  outputs = { nixpkgs, nixpkgs-unstable, agenix, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./configuration.nix
        agenix.nixosModules.default
      ];

      # Передаём unstable в конфигурацию
      specialArgs = {
        inherit agenix;
        inherit system;

        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };
    };
  };
}
