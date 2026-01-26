{
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.networkmanager.enable = true;

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [
    22
    9510 9511 9512
    3000 5713
    9000
    8096
    8090
  ];
  networking.firewall.allowedUDPPorts = [ 51820 8096 ];

  services.cloudflare-warp = {
    enable = true;
  };
}
