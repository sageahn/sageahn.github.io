---
layout: single
title: Arch Linux Installation on the VirtualBox
category: technote
tags: arch linux installation
comments: true
---

[link](http://wideaperture.net/blog/?p=3851)

Arch Linux를 내 맥북프로의 VirtualBox에 설치하려고 했었는데 Wiki만 보고는 영어의 압박으로 못하다가 위의 링크를 발견하고 일사천리로 진행. 링크가 조금 오래되어 약간 다른부분들도 있고, 설명이 길다보니 각 단계의 진행사항을 나중에 따라하기 힘들어 간결하게 정리 해 두었다.

# partitioning
virtualbox image 생성하고 iso파일로 부팅한다. 다음 작업은 partitioning
기본 파티션은 아래와 같음

gdisk /dev/sda

* boot - n, 1(default), just enter(default), +250M, 8300(default)
* swap - n, 2(default), just enter(default), +2G, 8200
* root - n, 3(default), just enter(default), +15G, 8300(default)
* home - n, 4(default), just enter(default), just enter, just enter

w will write down the partition table on /dev/sda

# formatting the partition
~~~ bash
mkfs -t ext4 /dev/sda1
mkfs -t ext4 /dev/sda3
mkfs -t ext4 /dev/sda4
mkswap /dev/sda2
~~~

# mount partitions
~~~ bash
swapon /dev/sda2
mount /dev/sda3 /mnt
cd /mnt;mkdir boot home
mount /dev/sda1 boot
mount /dev/sda4 home
~~~

# install archlinux
~~~
cd /
pacstrap /mnt base base-devel
genfstab -p /mnt >> /mnt/etc/fstab
~~~

#install bootloader
~~~
pacstrap /mnt syslinux
~~~

#setting boot loader and password, etc
~~~
arch-chroot /mnt
bash
vi /etc/locale.conf --> LANG="en_US.UTF-8"
vi /etc/locale.gen __> en_US.UTF-8
local-gen
ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime
touch /etc/hostname
cd /boot/syslinux
cp /usr/lib64/syslinux/bios/* .
extlinux --install /boot/syslinux
dd conv=notrunc bs=440 count=1 if=/usr/lib64/syslinux/bios/gptmbr.bin of=/dev/sda
mkinitcpio -p linux
passwd
exit
exit
umount /mnt/boot
amount /mnt/home
swapoff /dev/sda2
umount /mnt
sgdisk /dev/sda --attributes=1:set:2
~~~

# reboot
~~~
reboot
~~~

재부팅 한 후 부트화면에서 Arch Linux를 선택하고 로그인 한 뒤
dhcpcd를 실행

~~~
pacman -Syu
packman -S net-tools

mkdir -p /home/sage
groupadd sage
useradd sage -G sage -d /home/sage
chmod -R 700 /home/sage
chown -R sage /home/sage
chgrp -R sage /home/sage

sudo pacman -S xorg-server xorg-xinit xorg-server-utils
sudo pacman -S mesa
sudo pacman -S i3-wm i3status
~~~
