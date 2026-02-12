{ config, pkgs }:

let
  geoip = pkgs.fetchurl {
    url = "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat";
    sha256 = "sha256-jPPax9meQoo4C9OqEzD1dxinlNRf5PndIAd8AQ3AvNs=";
  };

  geosite = pkgs.fetchurl {
    url = "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat";
    sha256 = "sha256-HO8mirp4TPhBlrZXZpjAMI5ui96Lwno+fVt8SYPga/g=";
  };

  makeSingBoxAgeService = name: {
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

  makeSingBoxService = name: {
    systemd.services."vpn-${name}" = {
      enable = true;
      description = "Sing-Box (${name})";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        DynamicUser = true;
        User = "sing-box";
        Group = "sing-box";
        StateDirectory = "sing-box";
        CacheDirectory = "sing-box";
        ReadWritePaths = "/var/cache/sing-box";

        ExecStart = "${pkgs.sing-box}/bin/sing-box run -c ${./${name}.json}";
        Restart = "always";
        CapabilityBoundingSet = "CAP_NET_ADMIN CAP_NET_BIND_SERVICE";
        LimitNOFILE = 1048576;
      };
    };
  };
in {
  geoip = geoip;
  geosite = geosite;

  inherit makeSingBoxService makeSingBoxAgeService;
}
