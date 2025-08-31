{ config, pkgs, ... }:

{
  services.kmscon = {
    enable = false;
    hwRender = true;
    # fonts = [
      # { name = "Noto Color Emoji"; package = pkgs.noto-fonts-emoji-blob-bin; }
      # { name = "JetBrains Mono"; package = pkgs.jetbrains-mono; }
      # { name = "Twitter Color Emoji"; package = pkgs.twitter-color-emoji; }
      # { name = "Unifont"; package = pkgs.unifont; }
      # { name = "Noto Emoji"; package = pkgs.noto-fonts-emoji; }
    # ];
    extraOptions = "--term xterm-256color --font-size 11";
  };

  services.kmscon.extraConfig = ''
    font-name=Unifont
    font-size=18
  '';

  fonts.packages = with pkgs; [
    unifont
  ];
}
