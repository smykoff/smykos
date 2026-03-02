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
    ../programs/ssh-server.nix
    ../programs/docker.nix

    ../modules/gpu-amd.nix
    ../modules/dm-ly.nix
  ];
}
