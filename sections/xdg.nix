{ pkgs, ... }:

{
  xdg.autostart.enable = true;
  # xdg.portal.config.common.default = "*"; ON if sys don't broke
  
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}