{ pkgs, ... }:

let
  urserver = pkgs.stdenv.mkDerivation rec {
    pname = "unified-remote";
    version = "3.13.0"; # неофициально, может меняться

    src = pkgs.fetchurl {
      url = "https://www.unifiedremote.com/d/linux-x64-portable";
      name = "unified-remote.tar.gz";
      sha256 = "ae496fe8fa616b51e110fba76cbf042d8750f59d4537816b56c3709f2dff800e"; # актуально на май 2025
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = with pkgs; [ glibc libpulseaudio alsa-lib curl openssl xorg.libX11 xorg.libXtst ];

    installPhase = ''
      mkdir -p $out/opt/unified-remote

      tar -xzf $src -C $out/opt/unified-remote --strip-components=1

      mkdir -p $out/bin
      ln -s $out/opt/unified-remote/urserver $out/bin/urserver
    '';
  };

in {
  environment.systemPackages = [ urserver ];

  systemd.services.unified-remote = {
    description = "Unified Remote Server";
    wantedBy = [ "network.target" ];
    after = [ "network.target" ];

    serviceConfig = {
      ExecStart = "${urserver}/opt/unified-remote/urserver --daemon";
      RemainAfterExit = true;
      Restart = "always";
      User = "root";
    };
  };
}
