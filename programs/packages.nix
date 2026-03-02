{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    perl

    mission-center

    yazi
    helix
    neovim fd tree-sitter ripgrep
    psmisc
    sshfs
    go lua lua-language-server
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
