{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vulkan-tools vulkan-loader
    clinfo
  ];

  # GPU
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ amdvlk rocmPackages.clr.icd ];
    extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
  };

  environment.variables = {
    AMD_VULKAN_ICD = "RADV";  # Или "AMDVLK" если хотите проприетарный драйвер
  };
}
