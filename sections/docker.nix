{ pkgs, ... }:

{
  users.extraGroups.docker.members = [ "smykoff" "smykoil" ];

  environment.systemPackages = with pkgs; [ docker-buildx ];

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
