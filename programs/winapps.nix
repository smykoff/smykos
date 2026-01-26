{ winapps, ... }:

{
  environment.systemPackages = [
    winapps.winapps
    winapps.winapps-launcher
  ];
}
