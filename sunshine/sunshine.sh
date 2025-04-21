#!/bin/bash
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------

app=sunshine
#
#latest stable
#url=$(curl -s https://api.github.com/repos/LizardByte/Sunshine/releases/latest | grep 'browser_' | cut -d\" -f4 | grep AppImage)
#
#nightly
#url=https://github.com/LizardByte/Sunshine/releases/download/v0.19.1/sunshine.AppImage
#url=https://github.com/LizardByte/Sunshine/releases/download/v0.20.0/sunshine.AppImage
url=https://github.com/LizardByte/Sunshine/releases/download/nightly-dev/sunshine.AppImage
url2=https://batocera.pro/app/batocera-sunshine.AppImage

#--------------------------------------------------------------------------------------------------------------------------------
#################################################################################################################################
# optional: ---------------------------------------------------------------------------------------------------------------------
prefix="" 		# install directory, default: /userdata/system/pro/$app
name=""			# custom install info-name for app/package/system etc 
ext="" 			# default: extras.txt, filelist for download for get-extras
dep="" 			# get app dependencies (libs)  
repo=""			# specify custom repo (hosting)
mode="" 		# screen / text, default=screen
theme=""  		# color / bw, default=color
loader="" 		# loading animation yes/no, default=yes 
custom="" 		# run app-custom/post/install script, default=/extras/custom.sh  
port="" 		# add port (name), none = /extras/port.sh (to $app.sh), or /extras/launcher.sh 
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
				cd /tmp ; c=/tmp/batocera.pro-config ; rm $c 2>/dev/null
				echo "app="$app"" >> $c
				echo "url="$url"" >> $c
				echo "prefix="$prefix"" >> $c
				echo "name="$name"" >> $c
				echo "ext="$ext"" >> $c
				echo "dep="$dep"" >> $c
				echo "repo="$repo"" >> $c 
				echo "mode="$mode"" >> $c 
				echo "theme="$theme"" >> $c 
				echo "loader="$loader"" >> $c 
				echo "custom="$custom"" >> $c 
				echo "port="$port"" >> $c 
#################################################################################################################################
# start pro-framework 
cd /tmp/ ; rm /tmp/pro-framework.sh 2>/dev/null ; 
wget --no-cache -q -O /tmp/pro-framework.sh https://raw.githubusercontent.com/leponot/batocera.pro/main/.dep/pro-framework.sh ; 
dos2unix /tmp/pro-framework.sh ; source /tmp/pro-framework.sh 
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
say-hi
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
# 
function stop-sunshine() {
    # Ensure sunshine isn't running to avoid multispawns 
    killall -9 sunshine-keepalive sunshine sunshine.AppImage batocera-sunshine startup.sh 2>/dev/null && sleep 0.1
    killall -9 sunshine-keepalive sunshine sunshine.AppImage batocera-sunshine startup.sh 2>/dev/null && sleep 0.1
    killall -9 sunshine-keepalive sunshine sunshine.AppImage batocera-sunshine startup.sh 2>/dev/null && sleep 0.1
    lsof /userdata/system/pro/sunshine/extras/startup.sh 2>/dev/null | awk '{print $2}' | xargs -r kill -9 1>/dev/null 2>/dev/null && sleep 0.1
    lsof /userdata/system/pro/sunshine/batocera-sunshine 2>/dev/null | awk '{print $2}' | xargs -r kill -9 1>/dev/null 2>/dev/null && sleep 0.1
    lsof /userdata/system/sunshine/batocera-sunshine 2>/dev/null | awk '{print $2}' | xargs -r kill -9 1>/dev/null 2>/dev/null && sleep 0.1
    p=47980
    while [ $p -le 48011 ]; do 
        lsof -i :$p -t | xargs -r kill -9 1>/dev/null 2>/dev/null
        p=$(($p+1))
    done
    sleep 0.1
} 
stop-sunshine && stop-sunshine
#
get-appimage $url $prefix
get-appimage $url2 $prefix batocera-sunshine
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
get-extras
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
add-custom
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
add-port 
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
add-autostart
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
say-bye
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------

