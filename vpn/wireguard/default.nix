{ config, ... }: {
  age.secrets."nixos.conf.age" = {
    file = ./nixos.conf.age;
    path = "/etc/wireguard/nixos.conf";
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

  age.secrets."dev-neutron.conf.age" = {
    file = ./dev-neutron.conf.age;
    path = "/etc/wireguard/dev-neutron.conf";
    mode = "600";
    owner = "root";
  };

  networking.wg-quick.interfaces = {
    nixos = {
      configFile = config.age.secrets."nixos.conf.age".path;
      autostart = false;
    };
  };
}
