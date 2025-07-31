{ pkgs, unstable, agenix, system, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    mission-center

    psmisc
    unstable.nekoray
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
