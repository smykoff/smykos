{ pkgs, ... }:

let
  utils = import ./utils.nix { inherit pkgs; };
  outbounds = [ "ru-nixos-wg" "us-nixos-vless" ];
in {
  imports = map utils.decryptOutbound outbounds;
  environment.systemPackages = [ pkgs.sing-box ];
  environment.etc."sing-box/config.json".source = ./config.json;

  systemd.services."vpn-singbox" = {
    enable = true;
    description = "Sing-Box";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      StateDirectory = "sing-box";
      CacheDirectory = "sing-box";
      ReadWritePaths = "/var/cache/sing-box";

      ExecStart = "${pkgs.sing-box}/bin/sing-box run -C /etc/sing-box/";
      Restart = "always";
      CapabilityBoundingSet = "CAP_NET_ADMIN CAP_NET_BIND_SERVICE";
      LimitNOFILE = 1048576;
    };
  };
}
