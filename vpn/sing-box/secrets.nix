let
  smykoff = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICfOjFGqQ86Gj/NUuNtiEV9kqjDIrsJkzS44+8kIP6vO smykoff@nixos";
  smykoil = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFq/HTNS94eufUvRoTpL15b9f60X/AaGQw8/ps/I5wq+ smykoil@smykoil";
in {
  "my.json.age".publicKeys = [ smykoil smykoff ];
  "nixoswg.json.age".publicKeys = [ smykoil smykoff ];
  "main.json.age".publicKeys = [ smykoil smykoff ];

  "us-nixos-vless.outbound.json.age".publicKeys = [ smykoil smykoff ];
  "ru-nixos-wg.outbound.json.age".publicKeys = [ smykoil smykoff ];
}
