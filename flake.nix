{
  description = "SmykOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    agenix.url = "github:ryantm/agenix";

    winapps-pkgs = {
      url = "github:winapps-org/winapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, nixpkgs-unstable, agenix, winapps-pkgs, ... }:
    let
      system = "x86_64-linux";

      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };

      winapps = import winapps-pkgs {
        inherit system;
      };


      hosts = {
        station = {
          config = ./hosts/station.nix;
          hostName = "station";
        };

        laptop = {
          config = ./hosts/laptop.nix;
          hostName = "laptop";
        };
      };

      mkSystem = hostConfig: nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          /etc/nixos/hardware-configuration.nix
          ./configuration.nix
          agenix.nixosModules.default
          hostConfig.config
        ];

        specialArgs = {
          inherit inputs;
          inherit agenix;
          inherit system;
          inherit winapps;
          inherit unstable;

          inherit (hostConfig) hostName;
        };
      };

    in {
      nixosConfigurations = builtins.mapAttrs (_: hostConfig: mkSystem hostConfig) hosts;
    };
}
