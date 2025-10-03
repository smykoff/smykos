{ config, pkgs, ... }:

let
  makeSingBoxService = name: {
    age.secrets."${name}.json.age" = {
      file = ./${name}.json.age;
      path = "/etc/sing-box/${name}.json";
      mode = "644";
      owner = "root";
    };

    systemd.services."vpn-${name}" = {
      enable = true;
      description = "Sing-Box (${name})";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        ExecStart = "${pkgs.sing-box}/bin/sing-box run -c ${config.age.secrets."${name}.json.age".path}";
        Restart = "always";
        DynamicUser = true;
        CapabilityBoundingSet = "CAP_NET_ADMIN CAP_NET_BIND_SERVICE";
        LimitNOFILE = 1048576;
      };
    };
  };

  configs = [
    "kart"
    "m1lav"
    "my"
  ];

  singBoxServices = builtins.listToAttrs (map (name: {
    name = "singbox-${name}";
    value = makeSingBoxService name;
  }) configs);

in {
  imports = builtins.attrValues singBoxServices;

  environment.systemPackages = [ pkgs.sing-box ];
}
