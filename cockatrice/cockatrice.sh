#!/usr/bin/env bash 
######################################################################
# BATOCERA.PRO/COCKATRICE INSTALLER
######################################################################
APPNAME="COCKATRICE"     # for installer info
appname=cockatrice       # directory inside /userdata/system/pro/...
AppName=cockatrice       # app binary file name
APPPATH=/userdata/system/pro/$appname
APPLINK=http://batocera.pro/app/cockatrice.tar.gz
ORIGIN="COCKATRICE.GITHUB.IO V2.9" # credit & info
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
X=''               # 
W=''               # 
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
echo -e "${X}THIS WILL INSTALL $APPNAME FOR BATOCERA"
echo -e "${X}USING $ORIGIN"
echo
echo -e "${X}$APPNAME WILL BE AVAILABLE IN F1->APPLICATIONS "
echo -e "${X}AND INSTALLED IN /USERDATA/SYSTEM/PRO/$APPNAME"
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
X=''               # 
W=''               # 
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
line $cols '-'; echo
echo -e "${W}BATOCERA.PRO/${W}$APPNAME${W} INSTALLER ${W}"
line $cols '-'; echo
line $cols '-'; echo
echo
echo
sleep 0.33
clear
line $cols '='; echo
line $cols '-'; echo
line $cols '-'; echo
echo -e "${W}BATOCERA.PRO/${G}$APPNAME${W} INSTALLER ${W}"
line $cols '-'; echo
line $cols '-'; echo
line $cols '='; echo
echo
sleep 0.33
echo -e "${W}THIS WILL INSTALL $APPNAME FOR BATOCERA"
echo -e "${W}USING $ORIGIN"
echo
echo -e "${W}$APPNAME WILL BE AVAILABLE IN F1->APPLICATIONS"
echo -e "${W}AND INSTALLED IN /USERDATA/SYSTEM/PRO/$APPNAME${X}"
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
echo
echo -e "${G}DOWNLOADING${W}"
sleep 1
#echo -e "${T}$APPLINK" | sed 's,https://,> ,g' | sed 's,http://,> ,g' 2>/dev/null
pro=/userdata/system/pro
extra=$pro/$appname/extra
temp=$extra/downloads
rm -rf $temp 2>/dev/null
mkdir $temp 2>/dev/null
cd $temp
##c=cockatrice.tar.gz
##c1=cockatrice.tar.bz2.partaa
##c2=cockatrice.tar.bz2.partab
##curl --progress-bar --remote-name --location "https://github.com/leponot/batocera.pro/raw/main/$appname/extra/$c1"
##curl --progress-bar --remote-name --location "https://github.com/leponot/batocera.pro/raw/main/$appname/extra/$c2"
# --- join
##cat $temp/cockatrice.tar.bz2.parta* >$temp/cockatrice.tar.gz
###curl --progress-bar --remote-name --location "https://github.com/leponot/batocera.pro/raw/main/$appname/extra/cockatrice.zip"
###yes "y" | unzip -oq $PWD/cockatrice.zip 
#curl --progress-bar --remote-name --location "https://batocera.pro/app/cockatrice.tar.gz"
#wget --progress=bar:force --tries=10 --no-check-certificate --no-cache --no-cookies -O $temp/cockatrice.tar.gz http://batocera.pro/app/cockatrice.tar.gz
wget --progress=bar:force --tries=10 --no-check-certificate --no-cache --no-cookies -O $temp/cockatrice.tar.gz http://batocera.pro/app/cockatrice.tar.gz

echo -e "${X}EXTRACTING${X}"
pro=/userdata/system/pro
mkdir -p /userdata/system/pro/cockatrice 2>/dev/null
chmod a+x $pro/.dep/tar
$pro/.dep/tar -xf $temp/cockatrice.tar.gz
cp -r $temp/cockatrice/* $pro/cockatrice/
cd ~/
rm -rf $temp 2>/dev/null
#
SIZE=$(du -hs $pro/$appname | awk '{print $1}') 2>/dev/null
echo -e "${T}$pro/$appname   [${T}$SIZE]   ${G}OK${W}"
#echo -e "${G}> ${W}DONE"
echo
line $cols '='; echo

wget --tries=10 --no-check-certificate --no-cache --no-cookies -q -O $pro/$appname/extra/icon.png https://github.com/leponot/batocera.pro/raw/main/$appname/extra/icon.png
wget --tries=10 --no-check-certificate --no-cache --no-cookies -q -O $pro/$appname/.batocera https://github.com/leponot/batocera.pro/raw/main/$appname/extra/batocera.sh
dos2unix $pro/$appname/.batocera $pro/$appname/cockatrice 2>/dev/null
chmod 777 $pro/$appname/.batocera $pro/$appname/cockatrice 2>/dev/null

# --------------------------------------------------------------------
echo -e "${X}INSTALLING${X}"
launcher=/userdata/system/pro/$appname/Launcher
rm -rf $launcher
# --------------------------------------------------------------------
echo '#!/bin/bash ' >> $launcher
echo 'unclutter-remote -s' >> $launcher
echo 'DISPLAY=:0.0 /userdata/system/pro/cockatrice/cockatrice' >> $launcher
# --------------------------------------------------------------------
dos2unix $launcher
chmod a+x $launcher
# --------------------------------------------------------------------
# add to ports
mkdir -p /userdata/roms/ports 2>/dev/null
cp "$launcher" "/userdata/roms/ports/$appname.sh" 2>/dev/null
# --------------------------------------------------------------------
# -- get padtokey profile
rm "/userdata/roms/ports/$appname.sh.keys" 2>/dev/null 
wget --tries=10 -q -O "/userdata/roms/ports/$appname.sh.keys" "https://raw.githubusercontent.com/leponot/batocera.pro/main/$appname/extra/$appname.sh.keys"
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
echo
line $cols '='; echo
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
# BATOCERA.PRO/COCKATRICE INSTALLER //
#####################################
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
