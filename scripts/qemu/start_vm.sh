mach=$1
virtual_dir=/home/cham/virtual 
iso_file=$2
cpus=$3
mem=$4
disp=$5
order=$6
tap=$7

qemu-system-x86_64 -drive file=$virtual_dir/$mach.img,format=raw,index=0,media=disk -hdachs 1,1,1,none -m $mem -smp $cpus -drive file=$iso_file,index=1,media=cdrom -display $disp --enable-kvm -boot order=$order -net nic -net tap,ifname=$tap,script=no,downscript=no -M q35 -usbdevice tablet 
#-usb -device usb-host,vendorid=0x067b,productid=0x2303

exit

#-usb -device usb-host,hostbus=1,hostaddr=14

#qemu-system-x86_64 -drive file=/home/zhangheng/virtual/disk.img,format=raw,index=0,media=disk -hdachs 1,1,1,none -nographic -m 128 -smp 1 -s -curses
#qemu-system-x86_64 -drive file=/home/zhangheng/virtual/disk.img,format=raw,index=0,media=disk -hdachs 1,1,1,none -m 512 -smp 4 -s -drive file=/home/zhangheng/virtual/CSOS-DVD-x86_64-RC1.iso,index=1,media=cdrom -display vnc=:100 --enable-kvm -net nic -net tap,ifname=tap0,script=no,downscript=no
if [ "$1" = "sandbox" ];then
#qemu-system-x86_64 -drive file=/home/zhangheng/virtual/sandbox.img,format=raw,index=0,media=disk -hdachs 1,1,1,none -m 512 -smp 4 -drive file=/home/zhangheng/virtual/CSOS-DVD-x86_64-RC1.iso,index=1,media=cdrom -display vnc=:100 --enable-kvm -net nic -net tap,ifname=tap0,script=no,downscript=no
#qemu-system-x86_64 -drive file=/home/zhangheng/virtual/sandbox.img,format=raw,index=0,media=disk -hdachs 1,1,1,none -m 512 -smp 4 -drive file=/home/zhangheng/virtual/CSOS-DVD-x86_64-RC1.iso,index=1,media=cdrom -display gtk --enable-kvm -net nic -net tap,ifname=tap0,script=no,downscript=no
qemu-system-x86_64 -drive file=/home/zhangheng/virtual/sandbox.img,format=raw,index=0,media=disk -hdachs 1,1,1,none -m 512 -smp 4 -drive file=/home/zhangheng/virtual/CSOS-DVD-x86_64-RC1.iso,index=1,media=cdrom -display gtk --enable-kvm -net nic -net tap,ifname=tap0,script=no,downscript=no -boot order=dc
exit
fi
if [ "$1" = "centos" ];then
#qemu-system-x86_64 -drive file=/home/zhangheng/virtual/sandbox.img,format=raw,index=0,media=disk -hdachs 1,1,1,none -m 512 -smp 4 -drive file=/home/zhangheng/virtual/CSOS-DVD-x86_64-RC1.iso,index=1,media=cdrom -display vnc=:100 --enable-kvm -net nic -net tap,ifname=tap0,script=no,downscript=no
#qemu-system-x86_64 -drive file=/home/zhangheng/virtual/sandbox.img,format=raw,index=0,media=disk -hdachs 1,1,1,none -m 512 -smp 4 -drive file=/home/zhangheng/virtual/CSOS-DVD-x86_64-RC1.iso,index=1,media=cdrom -display gtk --enable-kvm -net nic -net tap,ifname=tap0,script=no,downscript=no
qemu-system-x86_64 -drive file=/home/zhangheng/virtual/centos.img,format=raw,index=0,media=disk -hdachs 1,1,1,none -m 512 -smp 4 -drive file=/home/zhangheng/virtual/CentOS-7-x86_64-Everything-1511.iso,index=1,media=cdrom -display gtk --enable-kvm -net nic -net tap,ifname=tap0,script=no,downscript=no -boot order=dc
exit
fi
