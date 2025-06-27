{ pkgs, unstable, agenix, system, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    psmisc
    unstable.nekoray
    rust-analyzer
    sshfs
    go
    python312 python313 python314 ruff
    ly
    wireguard-ui
    podman-compose
    unstable.steam
    nixd
    agenix.packages.${system}.default

    adwaita-icon-theme
    gnome-icon-theme
  ];
}
