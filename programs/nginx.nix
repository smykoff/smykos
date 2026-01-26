{
  services.nginx = {
    enable = true;

    clientMaxBodySize = "100m";

    virtualHosts = {
      "dev.smykoil.ru" = {
        listen = [
          { addr = "0.0.0.0"; port = 6080; }
        ];

        root = "/var/www";

        extraConfig = ''
          location / {
            proxy_request_buffering off;
            proxy_pass http://127.0.0.1:3000;
            proxy_http_version 1.1;

            proxy_set_header Host 127.0.0.1;
            proxy_set_header X-Real-IP $remote_addr;

            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection 'upgrade';
            proxy_cache_bypass $http_upgrade;
          }

          location /srv {
            proxy_request_buffering off;
            rewrite ^/srv/(.*)$ /$1 break;
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
