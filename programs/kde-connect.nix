{ pkgs, ... }:

{
  programs.kdeconnect = {
    enable = true;
    package = pkgs.kdePackages.kdeconnect-kde;
  };

  networking.firewall = {
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; }
    ];

    allowedUDPPortRanges = [
      { from = 1714; to = 1764; }
    ];
  };

  systemd.user.services.kdeconnect-autostart = {
    description = "KDE Connect for Sway";
    wantedBy = [ "sway-session.target" ];
    after = [ "sway-session.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.kdePackages.kdeconnect-kde}/bin/kdeconnect-indicator";
      Environment = "QT_QPA_PLATFORM=wayland";
      Restart = "on-failure";
    };
  };
}
