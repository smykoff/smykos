{ unstable, ... }:

{
  environment.systemPackages = with unstable; [ zapret ];

  services.zapret = {
    enable = true;

    package = unstable.zapret;

    params = [
      # "--wf-tcp=80,443,2053,2083,2087,2096,8443,%GameFilter% --wf-udp=443,19294-19344,50000-50100,%GameFilter% ^"
      "--filter-udp=443 --hostlist=${./zapret/list-general.txt} --hostlist-exclude=${./zapret/list-exclude.txt} --ipset-exclude=${./zapret/ipset-exclude.txt} --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=${./zapret/quic_initial_www_google_com.bin} --new ^"
      "--filter-udp=19294-19344,50000-50100 --filter-l7=discord,stun --dpi-desync=fake --dpi-desync-repeats=6 --new ^"
      "--filter-tcp=2053,2083,2087,2096,8443 --hostlist-domains=discord.media --dpi-desync=fake,fakedsplit --dpi-desync-repeats=6 --dpi-desync-fooling=ts --dpi-desync-fakedsplit-pattern=0x00 --dpi-desync-fake-tls=${./zapret/tls_clienthello_www_google_com.bin} --new ^"
      "--filter-tcp=443 --hostlist=${./zapret/list-google.txt} --dpi-desync=fake,fakedsplit --dpi-desync-repeats=6 --dpi-desync-fooling=ts --dpi-desync-fakedsplit-pattern=0x00 --dpi-desync-fake-tls=${./zapret/tls_clienthello_www_google_com.bin} --new ^"
      "--filter-tcp=80,443 --hostlist=${./zapret/list-general.txt} --hostlist-exclude=${./zapret/list-exclude.txt} --ipset-exclude=${./zapret/ipset-exclude.txt} --dpi-desync=fake,fakedsplit --dpi-desync-repeats=6 --dpi-desync-fooling=ts --dpi-desync-fakedsplit-pattern=0x00 --dpi-desync-fake-tls=${./zapret/tls_clienthello_www_google_com.bin} --new ^"
      "--filter-udp=443 --ipset=${./zapret/ipset-all.txt} --hostlist-exclude=${./zapret/list-exclude.txt} --ipset-exclude=${./zapret/ipset-exclude.txt} --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=${./zapret/quic_initial_www_google_com.bin} --new ^"
      "--filter-tcp=80,443 --ipset=${./zapret/ipset-all.txt} --hostlist-exclude=${./zapret/list-exclude.txt} --ipset-exclude=${./zapret/ipset-exclude.txt} --dpi-desync=fake,fakedsplit --dpi-desync-repeats=6 --dpi-desync-fooling=ts --dpi-desync-fakedsplit-pattern=0x00 --dpi-desync-fake-tls=${./zapret/tls_clienthello_www_google_com.bin} --new ^"
      # "--filter-udp=%GameFilter% --ipset=${./zapret/ipset-all.txt} --ipset-exclude=${./zapret/ipset-exclude.txt} --dpi-desync=fake --dpi-desync-autottl=2 --dpi-desync-repeats=12 --dpi-desync-any-protocol=1 --dpi-desync-fake-unknown-udp=${./zapret/quic_initial_www_google_com.bin} --dpi-desync-cutoff=n3"

      # auto hostlist
      # "--filter-tcp=80 --dpi-desync=fake,fakedsplit --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --hostlist-auto=/tmp/autohostlist.txt --new ^"
      # "--filter-tcp=443 --hostlist=${./zapret/list-youtube.txt} --dpi-desync=fake,multidisorder --dpi-desync-split-pos=1,midsld --dpi-desync-repeats=11 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls-mod=rnd,dupsid,sni=www.google.com --new ^"
      # "--filter-tcp=443 --dpi-desync=fake,multidisorder --dpi-desync-split-pos=midsld --dpi-desync-repeats=6 --dpi-desync-fooling=badseq,md5sig --hostlist-auto=/tmp/autohostlist.txt --new ^"
      # "--filter-udp=443 --hostlist=${./zapret/list-youtube.txt} --dpi-desync=fake --dpi-desync-repeats=11 --dpi-desync-fake-quic=${./zapret/quic_initial_www_google_com.bin} --new ^"
      # "--filter-udp=443 --dpi-desync=fake --dpi-desync-repeats=11 --hostlist=/tmp/autohostlist.txt --new ^"
      # "--filter-udp=50000-50099 --filter-l7=discord,stun --dpi-desync=fake"

      # default (fixed: badseq instead of md5sig)
      # "--filter-tcp=80 --hostlist=${./zapret/list-general.txt} --dpi-desync=fake,fakedsplit --dpi-desync-autottl=2 --dpi-desync-fooling=badseq --new ^"
      # "--filter-tcp=443 --hostlist=${./zapret/list-general.txt} --dpi-desync=fake,multidisorder --dpi-desync-split-pos=1,midsld --dpi-desync-repeats=6 --dpi-desync-fooling=badseq --dpi-desync-fake-tls-mod=rnd,dupsid,sni=www.google.com --new ^"
      # "--filter-tcp=443 --hostlist=${./zapret/list-general.txt} --dpi-desync=fake,multidisorder --dpi-desync-split-pos=midsld --dpi-desync-repeats=4 --dpi-desync-fooling=badseq --new ^"
      # "--filter-udp=443 --hostlist=${./zapret/list-general.txt} --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=${./zapret/quic_initial_www_google_com.bin} --new ^"
      # "--filter-udp=443 --hostlist=${./zapret/list-general.txt} --dpi-desync=fake --dpi-desync-repeats=6 --new ^"
      # "--filter-udp=50000-50099 --filter-l7=discord,stun --dpi-desync=fake"

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
