{ pkgs, ... }: 

{
  services.jellyfin = {
    enable = true;
    dataDir = "/mnt/jellyfin";
    user = "smykoff";
  };

  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
}