#!/bin/bash

useradd bwkim
useradd shpark
useradd ctshim
useradd hgryoo
useradd youngjinj
useradd hina
useradd ilhansong
useradd jmwon
useradd dhkim
useradd ykham

cp -rT /etc/skel /home/bwkim
cp -rT /etc/skel /home/shpark
cp -rT /etc/skel /home/ctshim
cp -rT /etc/skel /home/hgryoo
cp -rT /etc/skel /home/youngjinj
cp -rT /etc/skel /home/hina
cp -rT /etc/skel /home/ilhansong
cp -rT /etc/skel /home/jmwon
cp -rT /etc/skel /home/dhkim
cp -rT /etc/skel /home/ykham

chown -R bwkim:bwkim /home/bwkim
chown -R shpark:shpark /home/shpark
chown -R ctshim:ctshim /home/ctshim
chown -R hgryoo:hgryoo /home/hgryoo
chown -R youngjinj:youngjinj /home/youngjinj
chown -R hina:hina /home/hina
chown -R ilhansong:ilhansong /home/ilhansong
chown -R jmwon:jmwon /home/jmwon
chown -R dhkim:dhkim /home/dhkim
chown -R ykham:ykham /home/ykham

echo "bwkim:password" | chpasswd
echo "shpark:password" | chpasswd
echo "ctshim:password" | chpasswd
echo "hgryoo:password" | chpasswd
echo "youngjinj:password" | chpasswd
echo "hina:password" | chpasswd
echo "ilhansong:password" | chpasswd
echo "jmwon:password" | chpasswd
echo "dhkim:password" | chpasswd
echo "ykham:password" | chpasswd

usermod -aG wheel bwkim
usermod -aG wheel shpark
usermod -aG wheel ctshim
usermod -aG wheel hgryoo
usermod -aG wheel youngjinj
usermod -aG wheel hina
usermod -aG wheel ilhansong
usermod -aG wheel jmwon
usermod -aG wheel dhkim
usermod -aG wheel ykham
