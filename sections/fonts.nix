{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      font-awesome
      jetbrains-mono

      corefonts
      vistafonts
    ];
  };
}
