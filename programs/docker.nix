{
  users.extraGroups.docker.members = [ "smykoff" "smykoil" ];

  # systemd.services.docker.environment = {
  #   HTTP_PROXY  = "http://localhost:1083";
  #   HTTPS_PROXY = "http://localhost:1083";
  #   NO_PROXY    = "localhost,127.0.0.1,::1,.company.local,registry.company,10.0.0.0/8,192.168.0.0/16";
  # };

  virtualisation.docker.enable = true;
}
