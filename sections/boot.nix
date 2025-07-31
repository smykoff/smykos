{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.plymouth.enable = true;
  boot.plymouth.logo = ../plymouth/smykoil2.png;
  boot.plymouth.theme = "fade-in"; # или "spinfinity", "fade-in", "tribar", "text"
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
}
