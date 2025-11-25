{ pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  age.identityPaths = [
    "/home/smykoff/.ssh/id_smykoil"
    "/home/smykoff/.ssh/id_smykoff"
  ];

  services.xserver = {
    enable = true;

    # Configure keymap in X11
    xkb = {
      layout = "us,ru";
      variant = "";
    };

    windowManager.i3 = {
      enable = true;
      extraSessionCommands = ''
        export TERMINAL=kitty
      '';
    };

    desktopManager.gnome.enable = true;
  };

  environment.defaultPackages = with pkgs; [
    i3status
    i3lock
    dmenu
  ];

  programs.zsh.enable = true;
  programs.sway.enable = true;
  programs.sway.extraOptions = [ "--unsupported-gpu" ];
  programs.ssh.startAgent = true;
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  users.defaultUserShell = pkgs.zsh;

  environment.sessionVariables = {
    SECRET_SERVICE_BACKEND = "pass";
  };

  environment.etc."fuse.conf".text = ''
    user_allow_other
  '';
}
