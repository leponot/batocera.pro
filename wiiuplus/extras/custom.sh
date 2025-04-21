#!/bin/bash

p=/userdata/roms/ports
r=/userdata/roms/wiiu
c=/userdata/system/configs
a=/userdata/system/pro/wiiuplus
x=/userdata/system/pro/wiiuplus/extras

mkdir -p $c/emulationstation 2>/dev/null
mkdir -p $c/evmapy 2>/dev/null
mkdir -p $x 2>/dev/null

dos2unix $x/boost.sh 2>/dev/null
dos2unix $x/config.sh.keys 2>/dev/null
dos2unix $x/config.sh 2>/dev/null
dos2unix $x/es_features_ps3plus.cfg 2>/dev/null
dos2unix $x/es_systems_ps3plus.cfg 2>/dev/null
dos2unix $x/launcher.sh 2>/dev/null
dos2unix $x/cemuplus.desktop 2>/dev/null
dos2unix $x/wiiuplus.keys 2>/dev/null
dos2unix $x/startup.sh 2>/dev/null

chmod a+x $x/boost.sh 2>/dev/null
chmod a+x $x/config.sh 2>/dev/null
chmod a+x $x/launcher.sh 2>/dev/null
chmod a+x $x/cemuplus.desktop 2>/dev/null
chmod a+x $x/startup.sh 2>/dev/null
chmod a+x $x/rev 2>/dev/null

#cp $x/boost.sh $a/ 2>/dev/null
cp "$x/config.sh" "$r/■ CONFIG.sh" 2>/dev/null
cp "$x/config.sh.keys" "$r/■ CONFIG.sh.keys" 2>/dev/null
cp $x/es_features_wiiuplus.cfg $c/emulationstation/ 2>/dev/null
cp $x/es_systems_wiiuplus.cfg $c/emulationstation/ 2>/dev/null
cp $x/launcher.sh $a/ 2>/dev/null
cp $x/wiiuplus.desktop /usr/share/applications/ 2>/dev/null
cp $x/wiiuplus.keys $c/evmapy/ 2>/dev/null
cp $x/wiiu+.keys $c/evmapy/ 2>/dev/null

mkdir -p /userdata/system/.config/Cemu 2>/dev/null
mkdir -p /userdata/system/.local/share/Cemu 2>/dev/null
cp $x/settings.xml /userdata/system/.config/Cemu/ 2>/dev/null 
cp $x/settings.xml /userdata/system/.local/share/Cemu/ 2>/dev/null 

cd $x/ 
yes "A" | unzip -qq $x/configgen.zip -d $x/ 
cd ~/ 


# batocera compatibility fixes
function batocerafixes() {
echo
echo -e "${A}██${X}  ${H}applying batocera compatibility fixes..."
	cd ~/pro/ps3plus/rpcs3 
		wget -q --no-check-certificate --no-cache --no-cookies -O ~/pro/ps3plus/rpcs3/ai.AppImage "https://github.com/leponot/batocera.pro/raw/main/ps3plus/extras/ai.AppImage"
		wget -q --no-check-certificate --no-cache --no-cookies -O ~/pro/ps3plus/rpcs3/file "https://github.com/leponot/batocera.pro/raw/main/ps3plus/extras/file"
			chmod a+x ~/pro/ps3plus/rpcs3/ai.AppImage 2>/dev/null
			chmod a+x ~/pro/ps3plus/rpcs3/file 2>/dev/null 
				cp ~/pro/ps3plus/rpcs3/file /usr/bin/file 2>/dev/null 
		~/pro/ps3plus/rpcs3/rpcs3.AppImage --appimage-extract 1>/dev/null 2>/dev/null 
			rm -rf ~/pro/ps3plus/rpcs3/squashfs-root/usr/optional/libstdc* 2>/dev/null 
				# replace AppRun launch string 
				old_string='exec "$binary" "$@"'
				new_string='XDG_CONFIG_HOME=/userdata/system/configs \\\nXDG_CACHE_HOME=/userdata/system/cache \\\nQT_QPA_PLATFORM=xcb \\\nAMD_VULKAN_ICD=RADV \\\nDISABLE_LAYER_AMD_SWITCHABLE_GRAPHICS_1=1 \\\nexec "$binary" "$@"'
					sed -i "s|${old_string}|${new_string}|g" ~/pro/ps3plus/rpcs3/squashfs-root/AppRun
						dos2unix ~/pro/ps3plus/rpcs3/squashfs-root/AppRun 1>/dev/null 2>/dev/null 
						chmod a+x ~/pro/ps3plus/rpcs3/squashfs-root/AppRun 2>/dev/null
			rm ~/pro/ps3plus/rpcs3/rpcs3.AppImage
			#add missing libjack.so.0 
			cp $x/libjack.so.0 ~/pro/ps3plus/rpcs3/squashfs-root/usr/lib/ 2>/dev/null
			#add proper libstdc++.so.6 
			if [[ -e "/usr/bin/batocera-version" ]]; then 
				v="$(batocera-version | cut -c1-2)"
				if [[ "$v" = "38" ]] || [[ "$v" > "38" ]]; then  
					cp $x/libstdc++.so.6 ~/pro/ps3plus/rpcs3/squashfs-root/usr/lib/ 2>/dev/null 
				else
					echo
					echo " --  warning:  rpcs3 requires some updated system libraries and might,"
					echo "               or might not, work, with older versions of batocera... "
					echo 
				fi
			fi
		~/pro/ps3plus/rpcs3/ai.AppImage ~/pro/ps3plus/rpcs3/squashfs-root rpcs3.AppImage 1>/dev/null 2>/dev/null 
	rm -rf ~/pro/ps3plus/rpcs3/squashfs-root 2>/dev/null
	rm -rf ~/pro/ps3plus/rpcs3/ai.AppImage 2>/dev/null
echo -e "${A}██${X}  ${H}"
echo -e "${A}██${X}  ${H}----------------------------------------"
echo -e "${A}██${X}  ${H}########################################"
echo -e "${A}██${X}  ${H}"
echo -e "${A}██${X}  ${H}NOTE: "
echo -e "${A}██${X}  ${H}"
echo -e "${A}██${X}  ${H}configure rpcs3plus from f1 before use"
echo -e "${A}██${X}  ${H}"
echo -e "${A}██${X}  ${H}don't autoupdate rpcs3plus from the app,"
echo -e "${A}██${X}  ${H}only update it using this installer"
echo -e "${A}██${X}  ${H}"
echo -e "${A}██${X}  ${H}########################################"
echo -e "${A}██${X}  ${H}----------------------------------------"
echo -e "${A}██${X}  ${H}"
echo
# backup saves 
# timestamp=$(date +"%y%m%d-%H%M%S") 
mkdir /userdata/saves/wiiu-backup 2>/dev/null 
rsync -au /userdata/saves/wiiu/ /userdata/saves/wiiu-backup/ 2>/dev/null 
}
#batocerafixes

/userdata/system/pro/wiiuplus/extras/startup.sh 

curl http://127.0.0.1:1234/reloadgames 
