{ config, pkgs, ... }:

{
  programs.proxychains = {
    enable = true;
    package = pkgs.proxychains;
    
    chain = {
      type = "strict"; # Цепочка будет использовать все прокси по порядку
    };
    
    proxies = {
      myproxy = {               # Имя прокси (может быть любым)
        enable = true;
        type = "http";
        host = "127.0.0.1";     # Адрес
        port = 1080;            # Порт
      };
    };
    
    proxyDNS = true;          # Проксировать DNS запросы
    quietMode = false;          # Показывать подробный вывод
  };
}
