{ config, ... }:

{
  networking.hostName = "station";

  networking.wg-quick.interfaces = {
    devtun = {
      configFile = config.age.secrets."dev-station.conf.age".path;
      autostart = true;
    };
  };

  imports = [
    ../programs/steam.nix
    ../programs/jellyfin.nix
    ../programs/ssh-server.nix
    ../programs/waydroid.nix
    ../programs/docker.nix

    ../modules/gpu-nvidia.nix
    ../modules/dm-ly.nix
  ];
}
