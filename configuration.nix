{
  imports = [
    /etc/nixos/hardware-configuration.nix

    ./main.nix
    ./vpn

    ./utils/zapret.nix
    ./utils/ssh-server.nix
    ./utils/unified-remote.nix

    ./sections/boot.nix
    ./sections/dm.nix
    ./sections/docker.nix
    ./sections/fonts.nix
    ./sections/gpu.nix
    ./sections/jellyfin.nix
    ./sections/language.nix
    ./sections/libsecret.nix
    ./sections/network.nix
    ./sections/packages.nix
    ./sections/printing.nix
    ./sections/sounds.nix
    ./sections/ssh.nix
    ./sections/steam.nix
    ./sections/timezone.nix
    ./sections/users.nix
    ./sections/waydroid.nix
    ./sections/xdg.nix
    ./sections/console.nix
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
