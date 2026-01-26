{
  imports = [
    ./main.nix
    ./vpn
    ./programs/packages.nix

    ./sections/agenix.nix
    ./sections/boot.nix
    ./sections/console.nix
    ./sections/flakes-feature.nix
    ./sections/fonts.nix
    ./sections/language.nix
    ./sections/libsecret.nix
    ./sections/network.nix
    ./sections/printing.nix
    ./sections/sounds.nix
    ./sections/timezone.nix
    ./sections/users.nix
    ./sections/xdg.nix
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
