{ config, ... }: {
  age.secrets."m1lav.conf.age" = {
    file = ./m1lav.conf.age;
    path = "/etc/wireguard/m1lav.conf";
    mode = "600";
    owner = "root";
  };

  age.secrets."dev-station.conf.age" = {
    file = ./dev-station.conf.age;
    path = "/etc/wireguard/dev-station.conf";
    mode = "600";
    owner = "root";
  };

  age.secrets."dev-laptop.conf.age" = {
    file = ./dev-laptop.conf.age;
    path = "/etc/wireguard/dev-laptop.conf";
    mode = "600";
    owner = "root";
  };

  networking.wg-quick.interfaces = {
    wg = {
      configFile = config.age.secrets."m1lav.conf.age".path;
      autostart = false;
    };
  };
}
