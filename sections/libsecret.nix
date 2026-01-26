{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ gnome-keyring libsecret ];

  security.pam.services.ly.enableGnomeKeyring = true;
  security.pam.services.swayd.enableGnomeKeyring = true;

  environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "GNOME";
  };
}
