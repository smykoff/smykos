```sh
sudo -i # без пароля

# Разметка
lsblk # проверить диски

export DISK=/dev/sda

parted $DISK -- mklabel gpt
parted $DISK -- mkpart primary fat32 1MiB 512MiB
parted $DISK -- set 1 esp on
parted $DISK -- mkpart primary linux-swap 512MiB 16896MiB
parted $DISK -- mkpart primary ext4 16896MiB 100%

# nix-shell -p f2fs-tools # если команда mkfs.f2fs не найдена

mkfs.fat -F 32 /dev/sda1
mkswap /dev/sda2
mkfs.f2fs -f /dev/sda3

# Монтирование
mount -t f2fs /dev/sda3 /mnt
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot
swapon /dev/sda2

lsblk -f # тип должен быть f2fs

# Генерация базового конфига
nixos-generate-config --root /mnt
cp /mnt/etc/nixos/hardware-configuration.nix /etc/nixos/

# Установка
nixos-install --flake github:smykoff/smykos#laptop # laptop заменить на нужный конф
```
