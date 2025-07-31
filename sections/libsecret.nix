{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ gnome-keyring libsecret ];

  security.pam.services.ly.enableGnomeKeyring = true;
  security.pam.services.swayd.enableGnomeKeyring = true;

  environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "GNOME";
  };
  # security.pam.services.ly. = {
  # };

  # environment.systemPackages = with pkgs; [ libsecret pass pass-secret-service ];

  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # services.gnome.gnome-keyring.enable = true;

  # security.pam.services.login.enableGnomeKeyring = true;
  # security.polkit.enable = true;
}
