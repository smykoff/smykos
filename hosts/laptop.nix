{ config, ... }:

{
  networking.hostName = "laptop";

  networking.wg-quick.interfaces = {
    devtun = {
      configFile = config.age.secrets."dev-laptop.conf.age".path;
      autostart = true;
    };
  };

  imports = [
    ../programs/zapret
    ../programs/ssh-server.nix
    ../programs/docker.nix
    ../programs/proxychains.nix

    ../modules/gpu-amd.nix
    ../modules/dm-ly.nix
  ];
}
