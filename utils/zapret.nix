{ unstable, ... }:

{
  environment.systemPackages = with unstable; [ zapret ];

  services.zapret = {
    enable = true;

    package = unstable.zapret;

    params = [
      # auto hostlist
      # "--filter-tcp=80 --dpi-desync=fake,fakedsplit --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --hostlist-auto=/tmp/autohostlist.txt --new ^"
      # "--filter-tcp=443 --hostlist=${./zapret/list-youtube.txt} --dpi-desync=fake,multidisorder --dpi-desync-split-pos=1,midsld --dpi-desync-repeats=11 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls-mod=rnd,dupsid,sni=www.google.com --new ^"
      # "--filter-tcp=443 --dpi-desync=fake,multidisorder --dpi-desync-split-pos=midsld --dpi-desync-repeats=6 --dpi-desync-fooling=badseq,md5sig --hostlist-auto=/tmp/autohostlist.txt --new ^"
      # "--filter-udp=443 --hostlist=${./zapret/list-youtube.txt} --dpi-desync=fake --dpi-desync-repeats=11 --dpi-desync-fake-quic=${./zapret/quic_initial_www_google_com.bin} --new ^"
      # "--filter-udp=443 --dpi-desync=fake --dpi-desync-repeats=11 --hostlist=/tmp/autohostlist.txt --new ^"
      # "--filter-udp=50000-50099 --filter-l7=discord,stun --dpi-desync=fake"

      # default (fixed: badseq instead of md5sig)
      "--filter-tcp=80 --hostlist=${./zapret/list-general.txt} --dpi-desync=fake,fakedsplit --dpi-desync-autottl=2 --dpi-desync-fooling=badseq --new ^"
      "--filter-tcp=443 --hostlist=${./zapret/list-general.txt} --dpi-desync=fake,multidisorder --dpi-desync-split-pos=1,midsld --dpi-desync-repeats=6 --dpi-desync-fooling=badseq --dpi-desync-fake-tls-mod=rnd,dupsid,sni=www.google.com --new ^"
      "--filter-tcp=443 --hostlist=${./zapret/list-general.txt} --dpi-desync=fake,multidisorder --dpi-desync-split-pos=midsld --dpi-desync-repeats=4 --dpi-desync-fooling=badseq --new ^"
      "--filter-udp=443 --hostlist=${./zapret/list-general.txt} --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=${./zapret/quic_initial_www_google_com.bin} --new ^"
      "--filter-udp=443 --hostlist=${./zapret/list-general.txt} --dpi-desync=fake --dpi-desync-repeats=6 --new ^"
      "--filter-udp=50000-50099 --filter-l7=discord,stun --dpi-desync=fake"

      # old
      # "--filter-udp=443 --hostlist=${./zapret/list-general.txt} --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=${./zapret/quic_initial_www_google_com.bin} --new ^"
      # "--filter-udp=50000-50100 --filter-l7=discord,stun --dpi-desync=fake --dpi-desync-repeats=6 --new ^"
      # "--filter-tcp=80 --hostlist=${./zapret/list-general.txt} --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^"
      # "--filter-tcp=443 --hostlist=${./zapret/list-general.txt} --dpi-desync=fake,multidisorder --dpi-desync-split-pos=midsld --dpi-desync-repeats=8 --dpi-desync-fooling=md5sig,badseq --new ^"
      # "--filter-udp=443 --ipset=${./zapret/ipset-cloudflare.txt} --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=${./zapret/quic_initial_www_google_com.bin} --new ^"
      # "--filter-tcp=80 --ipset=${./zapret/ipset-cloudflare.txt} --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^"
      # "--filter-tcp=443 --ipset=${./zapret/ipset-cloudflare.txt} --dpi-desync=fake,multidisorder --dpi-desync-split-pos=midsld --dpi-desync-repeats=6 --dpi-desync-fooling=md5sig,badseq"
    ];
  };
}
