{ pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  age.identityPaths = [
    "/home/smykoff/.ssh/id_smykoil"
    "/home/smykoff/.ssh/id_smykoff"
    # "/home/smykoff/.ssh/id_smykoff"
  ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  programs.zsh.enable = true;
  programs.sway.enable = true;
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
