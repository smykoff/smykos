{ pkgs, unstable, agenix, system, winapps, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.nekoray = {
    enable = true;
    package = unstable.nekoray;
    tunMode.enable = true;
  };

  environment.systemPackages = with pkgs; [
    perl

    mission-center

    yazi
    helix
    psmisc
    rust-analyzer
    sshfs
    go
    python312 python313 python314 ruff
    ly
    wireguard-ui
    podman-compose
    nixd
    agenix.packages.${system}.default
    git
    whois
    bind.dnsutils

    adwaita-icon-theme
    gnome-icon-theme

    libnotify
    dialog
    freerdp3
    winapps.packages."${system}".winapps
    winapps.packages."${system}".winapps-launcher

    corefonts
    vistafonts
  ];
}
