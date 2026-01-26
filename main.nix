{ pkgs, ... }:

{
  services.xserver = {
    enable = true;

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

  programs.zsh.enable = true;
  programs.sway.enable = true;
  programs.sway.extraOptions = [ "--unsupported-gpu" "--my-next-gpu-wont-be-nvidia" ];
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
