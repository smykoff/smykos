{
  services.nginx = {
    enable = true;

    virtualHosts = {
      "fdev.smykoil.ru" = {
        listen = [
          { addr = "0.0.0.0"; port = 6080; }
        ];

        root = "/var/www";

        extraConfig = ''
          location / {
            proxy_pass http://localhost:3000;
            proxy_set_header Host localhost;
            proxy_set_header X-Real-IP $remote_addr;
          }
        '';
      };

      "bdev.smykoil.ru" = {
        listen = [
          { addr = "0.0.0.0"; port = 6080; }
        ];

        root = "/var/www";

        extraConfig = ''
          location / {
            proxy_pass http://127.0.0.1:80;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
          }
        '';
      };
    };
  };

  networking.firewall.allowedTCPPorts = [
    6080
    # 6443
  ];
}
