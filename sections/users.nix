{
  users.users.smykoff = {
    isNormalUser = true;
    description = "Pavel Smykov";
    extraGroups = [ "networkmanager" "wheel" "i2c" ];
  };

  users.users.smykoil = {
    isNormalUser = true;
    description = "MrThursby";
    extraGroups = [ "networkmanager" "wheel" "i2c" "video" "pipewire" ];
  };

  users.users.zaebir = {
    isNormalUser = true;
    description = "zaebir";
    extraGroups = [ "networkmanager" "wheel" "i2c" ];
  };
}
