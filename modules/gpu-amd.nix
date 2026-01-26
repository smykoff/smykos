{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vulkan-tools vulkan-loader
    clinfo
    mesa
    libdrm
    radeontop
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.variables = {
    AMD_VULKAN_ICD = "RADV";
  };
}
