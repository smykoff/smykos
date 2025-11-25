{ pkgs, config, ... }:

{
#  services.xserver.videoDrivers = [ "nvidia" ];

  environment.systemPackages = with pkgs; [
    vulkan-tools vulkan-loader
    clinfo
    mesa
    libdrm
    radeontop

    # pkgsi686Linux.mesa
    # pkgsi686Linux.libdrm
    # pkgsi686Linux.vulkan-loader
    # pkgsi686Linux.vulkan-tools
  ];

#   hardware.nvidia = {
#     modesetting.enable = true;
#     open = false;
#     nvidiaSettings = true;
#     package = config.boot.kernelPackages.nvidiaPackages.stable;
#   };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.variables = {
    AMD_VULKAN_ICD = "RADV";  # Или "AMDVLK" если хотите проприетарный драйвер
  };
}
