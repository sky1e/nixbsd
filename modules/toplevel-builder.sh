#!/usr/bin/env bash

mkdir -p $out/boot
cp -r $kernel/kernel $out/boot/kernel
for bootFile in $bootFiles; do
	cp -r $bootLoader/$bootFile $out/boot
done
echo "$activate" > $out/activate
chmod u+x $out/activate
mkdir -p $out/boot/loader.conf.d
cat <<EOF >$out/boot/loader.conf.d/$label.conf
init_path="$init"
init_shell="$initShell"
init_script="$out/activate"
vfs.root.mountfrom="ufs:/dev/ada1p1"
EOF
