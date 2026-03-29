{ pkgs, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.plymouth.enable = true;
  # boot.plymouth.logo = ../plymouth/smykoil2.png;
  boot.plymouth.theme = "connect"; # или "spinfinity", "fade-in", "tribar", "text"

  boot.plymouth.themePackages = with pkgs; [
    adi1090x-plymouth-themes

    # By default we would install all themes
    # (adi1090x-plymouth-themes.override {
    #   selected_themes = [ "rings" ];
    # })
  ];

  boot.supportedFilesystems = [ "f2fs" "ext4" ];

  boot.kernelModules = [ "i2c-dev" ];
  boot.kernelParams = [
    "quiet"
    "splash"
    "boot.shell_on_fail"
    "udev.log_priority=3"
    "rd.systemd.show_status=auto"
  ];

  boot.initrd.verbose = false;
  # boot.initrd.systemd.enable = true;
  # boot.initrd.kernelModules = [
    # "i915"
    # "amdgpu"
    # "nouveau"
  # ];

  hardware.i2c.enable = true;
}
