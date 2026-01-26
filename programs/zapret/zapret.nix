{ unstable, ... }:

{
  environment.systemPackages = with unstable; [ zapret ];

  services.zapret = {
    enable = true;

    package = unstable.zapret;

    params = [
      "--filter-tcp=443,2053,2083,2087,2096,8443,31337-31338"
      "--filter-udp=443,19294-19344,50000-50100,31337-31338"
      "--filter-udp=443"
      "--hostlist=/etc/zapret/list-general.txt"
      "--hostlist-exclude=/etc/zapret/list-exclude.txt"
      "--ipset-exclude=/etc/zapret/ipset-exclude.txt"
      "--dpi-desync=fake"
      "--dpi-desync-repeats=6"
      "--dpi-desync-fake-quic=/etc/zapret/quic_initial_www_google_com.bin"

      "--filter-udp=19294-19344,50000-50100"
      "--filter-l7=discord,stun"
      "--dpi-desync=fake"
      "--dpi-desync-repeats=6"

      "--filter-l3=ipv4"
      "--filter-tcp=443,2053,2083,2087,2096,8443,31337-31338"
      "--hostlist-exclude=/etc/zapret/list-exclude.txt"
      "--ipset-exclude=/etc/zapret/ipset-exclude.txt"
      "--dpi-desync=syndata,multidisorder"

      "--filter-udp=443"
      "--ipset=/etc/zapret/ipset-all.txt"
      "--hostlist-exclude=/etc/zapret/list-exclude.txt"
      "--ipset-exclude=/etc/zapret/ipset-exclude.txt"
      "--dpi-desync=fake"
      "--dpi-desync-repeats=6"
      "--dpi-desync-fake-quic=/etc/zapret/quic_initial_www_google_com.bin"

      "--filter-udp=31337-31338"
      "--ipset=/etc/zapret/ipset-all.txt"
      "--ipset-exclude=/etc/zapret/ipset-exclude.txt"
      "--dpi-desync=fake"
      "--dpi-desync-autottl=2"
      "--dpi-desync-repeats=14"
      "--dpi-desync-any-protocol"
      "--dpi-desync-fake-unknown-udp=/etc/zapret/quic_initial_www_google_com.bin"
      "--dpi-desync-cutoff=n3"
    ];
  };

  environment.etc = {
    "zapret/list-general.txt".source = ./list-general.txt;
    "zapret/list-exclude.txt".source = ./list-exclude.txt;
    "zapret/ipset-exclude.txt".source = ./ipset-exclude.txt;
    "zapret/ipset-all.txt".source = ./ipset-all.txt;
    "zapret/quic_initial_www_google_com.bin".source =
          ./quic_initial_www_google_com.bin;
  };
}
