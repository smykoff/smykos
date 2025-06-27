{
  fileSystems."/mnt/storage" = {
    device = "/dev/disk/by-uuid/0E1D-753A";
    fsType = "exfat";
    noCheck = true;
  };

  fileSystems."/mnt/temp" = {
    device = "/dev/disk/by-uuid/7be20dd1-67f6-4aba-87a5-e73d89bbf304";
    fsType = "f2fs";
    noCheck = true;
  };
}