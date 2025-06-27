{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ libsecret pass pass-secret-service ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.gnome.gnome-keyring.enable = true;

  security.pam.services.login.enableGnomeKeyring = true;
  security.polkit.enable = true;
}