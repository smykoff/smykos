{ config, pkgs, ... }:

let
  utils = import ./utils.nix { inherit pkgs config; };

  encryptedConfigs = [ "nixoswg" "my" ];
  singBoxAgeServices =
    builtins.listToAttrs (map (name: {
      name = "singbox-${name}";
      value = utils.makeSingBoxAgeService name;
    }) encryptedConfigs);

  configs = [ "router" ];
  singBoxServices =
    builtins.listToAttrs (map (name: {
      name = "singbox-${name}";
      value = utils.makeSingBoxService name;
    }) configs);
in {
  imports = builtins.attrValues singBoxServices ++ builtins.attrValues singBoxAgeServices;

  environment.systemPackages = [ pkgs.sing-box ];

  environment.etc."sing-box/geoip.dat".source = utils.geoip;
  environment.etc."sing-box/geosite.dat".source = utils.geosite;
}
