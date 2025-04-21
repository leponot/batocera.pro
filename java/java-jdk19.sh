#!/usr/bin/env bash 
# BATOCERA.PRO INSTALLER
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
#--------------------------------------------------------------------- 
#       DEFINE APP INFO >>
APPNAME=java
APPLINK=$(curl -s https://api.github.com/repos/Heroic-Games-Launcher/HeroicGamesLauncher/releases | grep AppImage | grep "browser_download_url" | head -n 1 | sed 's,^.*https://,https://,g' | cut -d \" -f1) 2>/dev/null
APPHOME=azul.com/downloads
#---------------------------------------------------------------------
#       DEFINE LAUNCHER COMMAND >>
COMMAND='mkdir /userdata/system/pro/'$APPNAME'/home 2>/dev/null; mkdir /userdata/system/pro/'$APPNAME'/config 2>/dev/null; mkdir /userdata/system/pro/'$APPNAME'/roms 2>/dev/null; HOME=/userdata/system/pro/'$APPNAME'/home XDG_CONFIG_HOME=/userdata/system/pro/'$APPNAME'/config QT_SCALE_FACTOR="1" GDK_SCALE="1" XDG_DATA_HOME=/userdata/system/pro/'$APPNAME'/home DISPLAY=:0.0 /userdata/system/pro/'$APPNAME'/'$APPNAME'.AppImage --no-sandbox'
#--------------------------------------------------------------------- 
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
# --------------------------------------------------------------------
APPNAME="${APPNAME^^}"; ORIGIN="${APPHOME^^}"; appname=$(echo "$APPNAME" | awk '{print tolower($0)}'); AppName=$appname; APPPATH=/userdata/system/pro/$appname/$AppName.AppImage
# --------------------------------------------------------------------
# --------------------------------------------------------------------
# show console/ssh info: 
clear 
echo 
echo 
echo 
echo -e "${X}PREPARING $APPNAME INSTALLER, PLEASE WAIT . . . ${X}"
echo 
echo 
echo 
# --------------------------------------------------------------------
# -- output colors:
###########################
X='\033[0m'               # 
W='\033[0m'               # 
#-------------------------#
RED='\033[0m'             # 
BLUE='\033[0m'            # 
GREEN='\033[0m'           # 
PURPLE='\033[0m'          # 
DARKRED='\033[0m'         # 
DARKBLUE='\033[0m'        # 
DARKGREEN='\033[0m'       # 
DARKPURPLE='\033[0m'      # 
###########################
# --------------------------------------------------------------------
# -- console theme
L=$X
R=$X
# --------------------------------------------------------------------
# -- prepare paths and files for installation: 
cd ~/
pro=/userdata/system/pro
mkdir $pro 2>/dev/null
mkdir $pro/extra 2>/dev/null
rm -rf $pro/$appname 2>/dev/null
mkdir $pro/$appname 2>/dev/null
mkdir $pro/$appname/extra 2>/dev/null
# --------------------------------------------------------------------
# -- pass launcher command as cookie for main function: 
command=$pro/$appname/extra/command; rm $command 2>/dev/null;
echo "$COMMAND" >> $command 2>/dev/null 
# --------------------------------------------------------------------
# -- prepare dependencies for this app and the installer: 
url=https://github.com/leponot/batocera.pro/raw/main/.dep
depfile=dependencies.txt; dep=$pro/.dep; mkdir $pro/.dep 2>/dev/null; cd $dep
wget -q -O $dep/$depfile $url/$depfile 2>/dev/null; dos2unix $dep/$depfile 1>/dev/null 2>/dev/null;
rm /userdata/system/pro/.dep/libtinfo.so.6 2>/dev/null
nl=$(cat $dep/$depfile | wc -l); l=1; while [[ "$l" -le "$((nl+2))" ]]; do
d=$(cat $dep/$depfile | sed ""$l"q;d"); wget -q -O $dep/$d $url/$d 2>/dev/null; 
if [[ "$(echo $d | grep "lib")" != "" ]]; then ln -s $dep/$d /lib/$d 2>/dev/null; fi; ((l++)); done
wget -q -O $pro/$appname/extra/icon.png https://github.com/leponot/batocera.pro/raw/main/$appname/extra/icon.png; chmod a+x $dep/tput; cd ~/
# --------------------------------------------------------------------
# // end of dependencies 
#
# --------------------------------------------------------------------
# -- run before installer:  
#killall wget 2>/dev/null && killall $AppName 2>/dev/null && killall $AppName 2>/dev/null && killall $AppName 2>/dev/null
# --------------------------------------------------------------------
cols=$($dep/tput cols) 2>/dev/null; rm -rf /userdata/system/pro/$appname/extra/cols 2>/dev/null
echo $cols >> /userdata/system/pro/$appname/extra/cols 2>/dev/null
line(){
  local start=1
  local end=${1:-80}
  local str="${2:-=}"
  local range=$(seq $start $end)
  for i in $range ; do echo -n "${str}"; done
}
# -- show console/ssh info: 
clear
echo
echo
echo
echo -e "${X}BATOCERA.PRO/$APPNAME INSTALLER${X}"
echo
echo
echo
echo
sleep 0.33
clear
echo
echo
line $cols '-'; echo
echo -e "${X}BATOCERA.PRO/$APPNAME INSTALLER${X}"
line $cols '-'; echo
echo
echo
echo
sleep 0.33
clear
echo
line $cols '-'; echo
line $cols ' '; echo
echo -e "${X}BATOCERA.PRO/$APPNAME INSTALLER${X}"
line $cols ' '; echo
line $cols '-'; echo
echo
echo
sleep 0.33
clear
line $cols '\'; echo
line $cols '/'; echo
line $cols ' '; echo
echo -e "${X}BATOCERA.PRO/$APPNAME INSTALLER${X}"
line $cols ' '; echo
line $cols '/'; echo
line $cols '\'; echo
echo
sleep 0.33
echo -e "${X}THIS WILL INSTALL JAVA-RUNTIME 19.0.1 FOR BATOCERA"
echo -e "${X}USING $ORIGIN"
echo
echo -e "${X}$APPNAME WILL BE INSTALLED IN /USERDATA/SYSTEM/PRO/$APPNAME"
echo -e "${X}AND AVAILABLE AS A SYSTEM ADDON" 
echo
echo -e "${X}FOLLOW THE BATOCERA DISPLAY"
echo
echo -e "${X}. . .${X}" 
echo
#/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
# --------------------------------------------------------------------
#\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
# -- THIS WILL BE SHOWN ON MAIN BATOCERA DISPLAY:   
function batocera-pro-installer {
APPNAME="$1"
appname="$2"
AppName="$3"
APPPATH="$4"
APPLINK="$5"
ORIGIN="$6"
# --------------------------------------------------------------------
# -- colors: 
###########################
X='\033[0m'               # 
W='\033[0m'               # 
#-------------------------#
RED='\033[0m'             # 
BLUE='\033[0m'            # 
GREEN='\033[0m'           # 
PURPLE='\033[0m'          # 
DARKRED='\033[0m'         # 
DARKBLUE='\033[0m'        # 
DARKGREEN='\033[0m'       # 
DARKPURPLE='\033[0m'      # 
###########################
# -- display theme:
L=$W
T=$W
R=$RED
B=$BLUE
G=$GREEN
P=$PURPLE
# --------------------------------------------------------------------
cols=$(cat /userdata/system/pro/.dep/display.cfg | tail -n 1) 2>/dev/null
cols=$(bc <<<"scale=0;$cols/1.3") 2>/dev/null
#cols=$(cat /userdata/system/pro/$appname/extra/cols | tail -n 1)
line(){
  local start=1
  local end=${1:-80}
  local str="${2:-=}"
  local range=$(seq $start $end)
  for i in $range ; do echo -n "${str}"; done
}
clear
echo
echo
echo
echo -e "${W}BATOCERA.PRO/${G}$APPNAME${W} INSTALLER ${W}"
echo
echo
echo
echo
sleep 0.33
clear
echo
echo
echo
echo -e "${W}BATOCERA.PRO/${W}$APPNAME${W} INSTALLER ${W}"
echo
echo
echo
echo
sleep 0.33
clear
echo
echo
line $cols '-'; echo
echo -e "${W}BATOCERA.PRO/${G}$APPNAME${W} INSTALLER ${W}"
line $cols '-'; echo
echo
echo
echo
sleep 0.33
clear
echo
line $cols '-'; echo
echo; #line $cols '-'; echo
echo -e "${W}BATOCERA.PRO/${W}$APPNAME${W} INSTALLER ${W}"
echo; #line $cols '-'; echo
line $cols '-'; echo
echo
echo
sleep 0.33
clear
line $cols '='; echo
echo; #line $cols '-'; echo
echo; #line $cols '-'; echo
echo -e "${W}BATOCERA.PRO/${G}$APPNAME${W} INSTALLER ${W}"
echo; #line $cols '-'; echo
echo; #line $cols '-'; echo
line $cols '='; echo
echo
sleep 0.33
echo -e "${W}THIS WILL INSTALL JAVA-RUNTIME 19.0.1 FOR BATOCERA"
echo -e "${W}USING $ORIGIN"
echo
echo -e "${W}$APPNAME WILL BE INSTALLED IN /USERDATA/SYSTEM/PRO/$APPNAME"
echo -e "${W}AND AVAILABLE AS A SYSTEM ADDON" 
echo
echo -e "${G}> > > ${W}PRESS ENTER TO CONTINUE"
read -p ""
echo; #line $cols '='; echo
# --------------------------------------------------------------------
# -- check system before proceeding
if [[ "$(uname -a | grep "x86_64")" != "" ]]; then 
:
else
echo
echo -e "${RED}ERROR: SYSTEM NOT SUPPORTED"
echo -e "${RED}YOU NEED BATOCERA X86_64${X}"
echo
sleep 5
exit 0
# quit
exit 0
fi
# --------------------------------------------------------------------
# -- temp for curl download
pro=/userdata/system/pro
temp=$pro/$appname/extra/downloads
rm -rf $temp 2>/dev/null 
mkdir -p $temp 2>/dev/null
# --------------------------------------------------------------------
echo
echo -e "${G}DOWNLOADING${W} JAVA-RUNTIME 19.0.1 PACKAGE [ 1+1 / 2 ] . . ."
url=https://github.com/leponot/batocera.pro/raw/main/
p1=java.tar.bz2.partaa
p2=java.tar.bz2.partab
cd $temp
curl --progress-bar --remote-name --location "$url/$appname/extra/$p1"
curl --progress-bar --remote-name --location "$url/$appname/extra/$p2"
SIZE=$(du -sh $temp | awk '{print $1}') 2>/dev/null
echo -e "${T}$temp  ${T}$SIZE( )  ${G}OK${W}" | sed 's/( )//g' 2>/dev/null
echo
echo; #line $cols '='; echo
sleep 1.333 
# --------------------------------------------------------------------
echo -e "${G}INSTALLING${W} . . ." 
# --------------------------------------------------------------------
cat $temp/java.tar.bz2.parta* >$temp/java.tar.gz 2>/dev/null
wget -q -O $pro/.dep/tar $url/.dep/tar 2>/dev/null
chmod a+x $pro/.dep/tar
$pro/.dep/tar -xf $temp/java.tar.gz 2>/dev/null
mv $temp/java/* $pro/java/
chmod a+x $pro/java/bin/* 2>/dev/null
rm -rf $temp 
cd ~/ 
SIZE=$(du -sh $pro/$appname | awk '{print $1}') 2>/dev/null
echo -e "${T}$pro/$appname  ${T}$SIZE( )  ${G}OK${W}" | sed 's/( )//g' 2>/dev/null
# --------------------------------------------------------------------
export='export PATH=/userdata/system/pro/java/bin:$PATH'
find="system/pro/java"
# --------------------------------------------------------------------
# attach java runtime to ~/.profile
file=/userdata/system/.profile
  if [[ -e "$file" ]]; then
temp=/userdata/system/.profile.tmp
rm $temp 2>/dev/null
nl=$(cat $file | wc -l)
l=1; while [[ $l -le $nl ]]; do
ln=$(cat $file | sed ""$l"q;d")
if [[ "$(echo $ln | grep "$find")" != "" ]]; then :; else echo "$ln" >> $temp; fi
((l++))
done
echo -e '\nexport PATH=/userdata/system/pro/java/bin:$PATH && export JAVA_HOME=/userdata/system/pro/java' >> $temp
cp $temp $file 2>/dev/null; rm $temp 2>/dev/null
  else
echo -e '\nexport PATH=/userdata/system/pro/java/bin:$PATH && export JAVA_HOME=/userdata/system/pro/java' >> $file
  fi
dos2unix /userdata/system/.profile 2>/dev/null
# --------------------------------------------------------------------
# attach java runtime to ~/.bashrc
file=/userdata/system/.bashrc
  if [[ -e "$file" ]]; then
temp=/userdata/system/.bashrc.tmp
rm $temp 2>/dev/null
nl=$(cat $file | wc -l)
l=1; while [[ $l -le $nl ]]; do
ln=$(cat $file | sed ""$l"q;d")
if [[ "$(echo $ln | grep "$find")" != "" ]]; then :; else echo "$ln" >> $temp; fi
((l++))
done
echo -e '\nexport PATH=/userdata/system/pro/java/bin:$PATH && export JAVA_HOME=/userdata/system/pro/java' >> $temp
cp $temp $file 2>/dev/null; rm $temp 2>/dev/null
  else
echo -e '\nexport PATH=/userdata/system/pro/java/bin:$PATH && export JAVA_HOME=/userdata/system/pro/java' >> $file
  fi
dos2unix /userdata/system/.bashrc 2>/dev/null
# --------------------------------------------------------------------
# run export: 
export PATH=/userdata/system/pro/java/bin:$PATH
export JAVA_HOME=/userdata/system/pro/java
# -- prepare launcher to solve dependencies on each run and avoid overlay, 
launcher=/userdata/system/pro/$appname/Launcher
rm -rf $launcher
echo '#!/bin/bash ' >> $launcher
echo 'export PATH=/userdata/system/pro/java/bin:$PATH && export JAVA_HOME=/userdata/system/pro/java' >> $launcher
echo 'function get-java-version {' >> $launcher
echo 'W="\033[0;37m" ' >> $launcher
echo 'java=/userdata/system/pro/java/bin/java' >> $launcher
echo 'if [[ -e "$java" ]]; then clear; echo -e "${W}JAVA RUNTIME AVAILABLE:"; echo; $java --version; sleep 4;' >> $launcher 
echo 'else clear; echo; echo -e "${W}JAVA RUNTIME NOT FOUND..."; echo; sleep 4; ' >> $launcher
echo 'fi' >> $launcher
echo '}' >> $launcher
echo 'export -f get-java-version 2>/dev/null' >> $launcher
echo 'function get-xterm-fontsize {' >> $launcher
echo 'tput=/userdata/system/pro/.dep/tput; chmod a+x $tput;' >> $launcher 
echo 'cp /userdata/system/pro/.dep/libtinfo.so.6 /lib/libtinfo.so.6 2>/dev/null' >> $launcher
echo 'cfg=/userdata/system/pro/.dep/display.cfg; rm $cfg 2>/dev/null' >> $launcher
echo 'DISPLAY=:0.0 xterm -fullscreen -bg "black" -fa "Monospace" -e bash -c "$tput cols >> $cfg" 2>/dev/null' >> $launcher
echo 'cols=$(cat $cfg | tail -n 1) 2>/dev/null' >> $launcher
echo 'TEXT_SIZE=$(bc <<<"scale=0;$cols/16") 2>/dev/null' >> $launcher
echo '}' >> $launcher
echo 'export -f get-xterm-fontsize 2>/dev/null' >> $launcher
echo 'get-xterm-fontsize 2>/dev/null' >> $launcher
echo 'cfg=/userdata/system/pro/.dep/display.cfg' >> $launcher
echo 'cols=$(cat $cfg | tail -n 1) 2>/dev/null' >> $launcher
echo 'until [[ "$cols" != "80" ]] ' >> $launcher
echo 'do' >> $launcher
echo 'get-xterm-fontsize 2>/dev/null' >> $launcher
echo 'cols=$(cat $cfg | tail -n 1) 2>/dev/null' >> $launcher
echo 'done ' >> $launcher
echo 'TEXT_SIZE=$(bc <<<"scale=0;$cols/16") 2>/dev/null' >> $launcher
echo 'DISPLAY=:0.0 xterm -fullscreen -bg black -fa 'Monospace' -fs $TEXT_SIZE -e bash -c "get-java-version" 2>/dev/null' >> $launcher
dos2unix $launcher 2>/dev/null
chmod a+x $launcher 2>/dev/null
rm /userdata/system/pro/$appname/extra/command 2>/dev/null
# --------------------------------------------------------------------
# -- prepare f1 - applications - app shortcut, 
shortcut=/userdata/system/pro/$appname/extra/$appname.desktop
rm -rf $shortcut 2>/dev/null
echo "[Desktop Entry]" >> $shortcut
echo "Version=1.0" >> $shortcut 
echo "Icon=/userdata/system/pro/$appname/extra/icon.png" >> $shortcut
echo "Exec=/userdata/system/pro/$appname/Launcher" >> $shortcut
echo "Terminal=false" >> $shortcut
echo "Type=Application" >> $shortcut
echo "Categories=Game;batocera.linux;" >> $shortcut
echo "Name=$appname" >> $shortcut
f1shortcut=/usr/share/applications/$appname.desktop
dos2unix $shortcut 2>/dev/null
chmod a+x $shortcut 2>/dev/null
cp $shortcut $f1shortcut 2>/dev/null
# --------------------------------------------------------------------
# -- prepare prelauncher to avoid overlay,
pre=/userdata/system/pro/$appname/extra/startup
rm -rf $pre 2>/dev/null
echo "#!/usr/bin/env bash" >> $pre
echo "cp /userdata/system/pro/$appname/extra/$appname.desktop /usr/share/applications/ 2>/dev/null" >> $pre
echo "cp /userdata/system/pro/$appname/bin/java /usr/bin/java 2>/dev/null" >> $pre
dos2unix $pre 2>/dev/null
chmod a+x $pre 2>/dev/null
# -- add prelauncher to custom.sh to run @ reboot
csh=/userdata/system/custom.sh
if [[ -e $csh ]] && [[ "$(cat $csh | grep "/userdata/system/pro/$appname/extra/startup")" = "" ]]; then
echo -e "\n/userdata/system/pro/$appname/extra/startup" >> $csh
fi
if [[ -e $csh ]] && [[ "$(cat $csh | grep "/userdata/system/pro/$appname/extra/startup" | grep "#")" != "" ]]; then
echo -e "\n/userdata/system/pro/$appname/extra/startup" >> $csh
fi
if [[ -e $csh ]]; then :; else
echo -e "\n/userdata/system/pro/$appname/extra/startup" >> $csh
fi
dos2unix $csh 2>/dev/null
chmod a+x $csh 2>/dev/null
# -- done. 
sleep 1
echo -e "${G}> ${W}DONE${W}"
echo
sleep 1
echo
echo -e "${W}> $APPNAME INSTALLED ${G}OK${W}"
line $cols '='; echo
sleep 3
}
export -f batocera-pro-installer 2>/dev/null
# --------------------------------------------------------------------
# RUN:
# |
  batocera-pro-installer "$APPNAME" "$appname" "$AppName" "$APPPATH" "$APPLINK" "$ORIGIN"
# --------------------------------------------------------------------
clear
echo
echo -e "${W}> $APPNAME INSTALLED"
echo
