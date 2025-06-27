let
  smykoff = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICfOjFGqQ86Gj/NUuNtiEV9kqjDIrsJkzS44+8kIP6vO smykoff@nixos";
  smykoil = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFq/HTNS94eufUvRoTpL15b9f60X/AaGQw8/ps/I5wq+ smykoil@smykoil";
in {
  "m1lav.conf.age".publicKeys = [ smykoil smykoff ];
}
