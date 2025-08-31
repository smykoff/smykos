{ pkgs, unstable, agenix, system, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.nekoray = {
    enable = true;
    package = unstable.nekoray;
    tunMode.enable = true;
  };

  environment.systemPackages = with pkgs; [
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

    adwaita-icon-theme
    gnome-icon-theme
  ];
}
