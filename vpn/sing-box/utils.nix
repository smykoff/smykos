{ pkgs }:

let
  decryptOutbound = name: {
    age.secrets."${name}.outbound.json.age" = {
      file = ./${name}.outbound.json.age;
      path = "/etc/sing-box/${name}.outbound.json";
      mode = "644";
      owner = "root";
    };
  };
in {
  inherit decryptOutbound;
}
