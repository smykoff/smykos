{ system, agenix, ... }:

{
  age.identityPaths = [
    "/home/smykoil/.ssh/id_smykoil"
    "/home/smykoff/.ssh/id_smykoff"
  ];


  environment.systemPackages = [
    agenix.packages.${system}.default
  ];
}
