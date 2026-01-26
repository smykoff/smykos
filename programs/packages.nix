{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    perl

    mission-center

    yazi
    helix
    psmisc
    sshfs
    go
    python312 python313 python314 ruff
    git
    whois
    bind.dnsutils

    adwaita-icon-theme
    gnome-icon-theme

    libnotify
    dialog # TODO: delete?
    gnumake
  ];
}
