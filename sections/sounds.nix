{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # lowLatency = {
    #   # enable this module
    #   enable = true;
    #   # defaults (no need to be set unless modified)
    #   quantum = 64;
    #   rate = 48000;
    # };

    extraConfig.pipewire = {
      "bluez-monitor.conf" = {
        "properties" = {
          "bluez5.headset-roles" = [ ];
        };
      };
    };
  };

  security.rtkit.enable = true;
}
