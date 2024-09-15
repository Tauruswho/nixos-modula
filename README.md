# sample only


nixos-modula
Nixos with configuration in separate nix modules....Experimental ..More work to do but works....


## For Nixos zfs on root:-

zpool create -o ashift=12 -o autotrim=on -O acltype=posixacl -O mountpoint=none -O dnodesize=auto -O atime=off -O relatime=on -O compression=zstd -O normalization=formD -O xattr=sa nixos mirror /dev/disk/by-id/WD-Blue-1-part-2... /dev/disk/by-id/WD-Blue-2-part-2...

zfs create -o mountpoint=legacy nixos/root
zfs create -o mountpoint=legacy nixos/nix
zfs create -o mountpoint=legacy nixos/var
zfs create -o mountpoint=legacy nixos/home
# maybe after install for some of these.....
zfs create -o mountpoint=/home/mark nixos/home/mark
zfs create -o mountpoint=/home/monica nixos/home/monica
zfs create -o mountpoint=/home/mince nixos/home/mince
zfs create -o mountpoint=/home/guest nixos/home/guest
zfs create -o mountpoint=/home/mark/Music nixos/home/mark/Music
zfs create -o mountpoint=/home/mark/Pictures nixos/home/mark/Pictures
zfs create -o mountpoint=/home/mark/Videos nixos/home/mark/Videos
zfs create -o mountpoint=/home/mark/Downloads/isos
zfs create -o mountpoint=/home/monica/Music nixos/home/monica/Music
zfs create -o mountpoint=/home/monica/Pictures nixos/home/monica/Pictures
zfs create -o mountpoint=/home/monica/Videos nixos/home/monica/Video


mkdir /mnt/root
mount -t zfs nixos/root /mnt
mkdir /mnt/nix /mnt/var /mnt/home

mount -t zfs nixos/nix /mnt/nix
mount -t zfs nixos/var /mnt/var
mount -t zfs nixos/home /mnt/home

mkfs.fat -F 32 -n boot /dev/nvme0n1p1 (/dev/disk/by-id/WD-Blue-1-part-1)

mkdir -p /mnt/boot
mount -o umask=077 /dev/disk/by-label/boot /mnt/boot

nixos-generate-config --root /mnt

# edit /mnt/etc/nixos/hardware-configuration.nix,
# copy or download from git all configuration files and edit host name etc,
# then:-
nixos-install

####

