{
  users.extraGroups.docker.members = [ "smykoff" "smykoil" ];

  virtualisation = {
    docker = {
      enable = true;
    };

    # podman = {
    #   enable = true;
    #   dockerCompat = true;
    #   defaultNetwork.settings.dns_enabled = true;
    # };
  };
}
