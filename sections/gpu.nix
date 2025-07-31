{ pkgs, ... }:

{
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

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.variables = {
    AMD_VULKAN_ICD = "RADV";  # Или "AMDVLK" если хотите проприетарный драйвер
  };
}
