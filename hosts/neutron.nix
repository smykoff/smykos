{ config, ... }:

{
  networking.hostName = "neutron";

  networking.wg-quick.interfaces = {
    devtun = {
      configFile = config.age.secrets."dev-neutron.conf.age".path;
      autostart = true;
    };
  };

  imports = [
    ../programs/steam.nix
    ../programs/zapret
    ../programs/ssh-server.nix
    ../programs/proxychains.nix
    ../programs/docker.nix

    ../modules/gpu-nvidia.nix
    ../modules/dm-ly.nix
  ];
}
