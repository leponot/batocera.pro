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
# --------------------------------------------------------------------
#      DEFINE APP INFO:
APPNAME=sak 
APPLINK=https://github.com/leponot/batocera.pro/raw/main/sak/extra/sak.zip 
APPHOME="github.com/dezem/SAK  (v0.7.14_64bit)" 
# --------------------------------------------------------------------
                                                                       APPNAME="${APPNAME^^}"; ORIGIN="${APPHOME^^}"; appname=$(echo "$APPNAME" | awk '{print tolower($0)}'); AppName=$appname; APPPATH=/userdata/system/pro/$appname/$AppName.AppImage
# --------------------------------------------------------------------
#      DEFINE LAUNCHER COMMAND: 
COMMAND='cp /userdata/bios/switch/*.keys /userdata/system/pro/sak/bin/ 2>/dev/null && DISPLAY=:0.0 batocera-wine lutris play /userdata/system/pro/'$appname'/SAK.exe'
# --------------------------------------------------------------------
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
mkdir $pro/$appname 2>/dev/null
mkdir $pro/$appname/extra 2>/dev/null
# --------------------------------------------------------------------
# -- pass launcher command as cookie for main function: 
command=$pro/$appname/extra/command; rm $command 2>/dev/null;
echo "$COMMAND" >> $command 2>/dev/null 
# --------------------------------------------------------------------
# -- prepare dependencies for this app and the installer: 
mkdir -p ~/pro/.dep 2>/dev/null && cd ~/pro/.dep && wget --tries=10 --no-check-certificate --no-cache --no-cookies -q -O ~/pro/.dep/dep.zip https://github.com/leponot/batocera.pro/raw/main/.dep/dep.zip && yes "y" | unzip -oq ~/pro/.dep/dep.zip && cd ~/
wget --tries=10 --no-check-certificate --no-cache --no-cookies -q -O $pro/$appname/extra/icon.png https://github.com/leponot/batocera.pro/raw/main/$appname/extra/icon.png; chmod a+x $dep/* 2>/dev/null; cd ~/
chmod 777 ~/pro/.dep/* && for file in /userdata/system/pro/.dep/lib*; do sudo ln -s "$file" "/usr/lib/$(basename $file)"; done
# --------------------------------------------------------------------
# // end of dependencies 
#
# -- run before installer:  
killall wget 2>/dev/null && killall $AppName 2>/dev/null && killall $AppName 2>/dev/null && killall $AppName 2>/dev/null
# --------------------------------------------------------------------
cols=$($dep/tput cols); rm -rf /userdata/system/pro/$appname/extra/cols
echo $cols >> /userdata/system/pro/$appname/extra/cols
line(){
echo 1>/dev/null
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
sleep 0.33

clear
echo
echo
echo -e "${W}- - - - - - -"
echo -e "${X}BATOCERA.PRO/$APPNAME INSTALLER${X}"
echo -e "${W}- - - - - - -"
echo
echo
sleep 0.33

clear
echo
echo -e "${W}- - - - - - -"
echo
echo -e "${X}BATOCERA.PRO/$APPNAME INSTALLER${X}"
echo
echo -e "${W}- - - - - - -"
echo
sleep 0.33

clear
echo -e "${W}- - - - - - -"
echo
echo
echo -e "${X}BATOCERA.PRO/$APPNAME INSTALLER${X}"
echo
echo
echo -e "${W}- - - - - - -"
sleep 0.33

clear
echo
echo
echo
echo -e "${X}BATOCERA.PRO/$APPNAME INSTALLER${X}"
echo
echo
echo
sleep 0.33

echo -e "${X}THIS WILL INSTALL $APPNAME FOR BATOCERA"
echo -e "${X}USING $ORIGIN"
echo
echo -e "${X}$APPNAME WILL BE AVAILABLE F1->APPLICATIONS"
echo -e "${X}AND INSTALLED IN /USERDATA/SYSTEM/PRO/$APPNAME"
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
cols=$(cat /userdata/system/pro/.dep/display.cfg | tail -n 1)
cols=$(bc <<<"scale=0;$cols/1.3") 2>/dev/null
#cols=$(cat /userdata/system/pro/$appname/extra/cols | tail -n 1)
line(){
echo 1>/dev/null
}
clear
echo
echo
echo
echo -e "${W}BATOCERA.PRO/${G}$APPNAME${W} INSTALLER ${W}"
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
sleep 0.33

clear
echo
echo
echo -e "${W}- - - - - - -"
echo -e "${W}BATOCERA.PRO/${G}$APPNAME${W} INSTALLER ${W}"
echo -e "${W}- - - - - - -"
echo
echo
sleep 0.33
clear

echo
echo -e "${W}- - - - - - -"
echo
echo -e "${W}BATOCERA.PRO/${W}$APPNAME${W} INSTALLER ${W}"
echo 
echo -e "${W}- - - - - - -"
echo
sleep 0.33

clear
echo -e "${W}- - - - - - -"
echo 
echo 
echo -e "${W}BATOCERA.PRO/${G}$APPNAME${W} INSTALLER ${W}"
echo 
echo 
echo -e "${W}- - - - - - -"
sleep 0.33

clear
echo
echo
echo 
echo -e "${W}BATOCERA.PRO/${G}$APPNAME${W} INSTALLER ${W}"
echo 
echo 
echo
sleep 0.33

echo
echo -e "${W}THIS WILL INSTALL $APPNAME FOR BATOCERA"
echo -e "${W}USING $ORIGIN"
echo 
echo -e "${W}$APPNAME WILL BE AVAILABLE F1->APPLICATIONS"
echo -e "${W}AND INSTALLED IN /USERDATA/SYSTEM/PRO/$APPNAME"
echo
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
temp=/userdata/system/pro/$appname/extra/downloads
rm -rf $temp 2>/dev/null
mkdir -p $temp 2>/dev/null
# --------------------------------------------------------------------
echo
echo -e "${G}DOWNLOADING${W} $APPNAME . . ."
sleep 1
echo -e "${T}$APPLINK" | sed 's,https://,> ,g' | sed 's,http://,> ,g' 2>/dev/null
cd $temp
curl --progress-bar --remote-name --location "$APPLINK"
yes "A" | unzip -qq $appname.zip 2>/dev/null
cp -rL $temp/$appname/* $pro/$appname/ 2>/dev/null
cd ~/; rm -rf $temp 2>/dev/null
SIZE=$(du -sh $pro/$appname | awk '{print $1}') 2>/dev/null
echo -e "${T}$pro/$appname  ${T}$SIZE( )  ${G}OK${W}" | sed 's/( )//g'
#echo -e "${G}> ${W}DONE"
echo
echo; #line $cols '='; echo
sleep 1.333
# --------------------------------------------------------------------
echo -e "${G}INSTALLING${W}"
# -- prepare launcher to solve dependencies on each run and avoid overlay, 
launcher=/userdata/system/pro/$appname/Launcher
rm -rf $launcher
echo '#!/bin/bash ' >> $launcher
echo 'unclutter-remote -s' >> $launcher
## -- GET APP SPECIFIC LAUNCHER COMMAND: 
######################################################################
echo "$(cat /userdata/system/pro/$appname/extra/command)" >> $launcher
######################################################################
dos2unix $launcher
chmod a+x $launcher
rm /userdata/system/pro/$appname/extra/command 2>/dev/null
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
echo "Name=SAK" >> $shortcut
f1shortcut=/usr/share/applications/$appname.desktop
dos2unix $shortcut
chmod a+x $shortcut
cp $shortcut $f1shortcut 2>/dev/null
# -- prepare prelauncher to avoid overlay,
pre=/userdata/system/pro/$appname/extra/startup
rm -rf $pre 2>/dev/null
echo "#!/usr/bin/env bash" >> $pre
echo "cp /userdata/system/pro/$appname/extra/$appname.desktop /usr/share/applications/ 2>/dev/null" >> $pre
dos2unix $pre
chmod a+x $pre
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
dos2unix $csh
# -- done. 
sleep 1
echo -e "${G}> ${W}DONE${W}"
echo
sleep 1
echo
echo; #line $cols '='; echo
echo -e "${W}> $APPNAME INSTALLED ${G}OK${W}"
line $cols '='; echo
echo "1" >> /userdata/system/pro/$appname/extra/status 2>/dev/null
sleep 3
}
export -f batocera-pro-installer 2>/dev/null
# --------------------------------------------------------------------
# RUN:
# |
  batocera-pro-installer "$APPNAME" "$appname" "$AppName" "$APPPATH" "$APPLINK" "$ORIGIN"
# --------------------------------------------------------------------
# BATOCERA.PRO INSTALLER //
##########################
function autostart() {
  csh="/userdata/system/custom.sh"
  pcsh="/userdata/system/pro-custom.sh"
  pro="/userdata/system/pro"
  rm -f $pcsh
  temp_file=$(mktemp)
  find $pro -type f \( -path "*/extra/startup" -o -path "*/extras/startup.sh" \) > $temp_file
  echo "#!/bin/bash" > $pcsh
  sort $temp_file >> $pcsh
  rm $temp_file
  chmod a+x $pcsh
  temp_csh=$(mktemp)
  grep -vxFf $pcsh $csh > $temp_csh
  mapfile -t lines < $temp_csh
  if [[ "${lines[0]}" != "#!/bin/bash" ]]; then
    lines=( "#!/bin/bash" "${lines[@]}" )
  fi
  if ! grep -Fxq "$pcsh &" $temp_csh; then
    lines=( "${lines[0]}" "$pcsh &" "${lines[@]:1}" )
  fi
  printf "%s\n" "${lines[@]}" > $csh
  chmod a+x $csh
  rm $temp_csh
}
export -f autostart
autostart
exit 0
