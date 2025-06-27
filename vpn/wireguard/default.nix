{ config, ... }: {
  age.secrets."m1lav.conf.age" = {
    file = ./m1lav.conf.age;
    path = "/etc/wireguard/m1lav.conf";
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
