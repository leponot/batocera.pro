#!/bin/bash

# Get the machine hardware name
architecture=$(uname -m)

# Check if the architecture is x86_64 (AMD/Intel)
if [ "$architecture" != "x86_64" ]; then
    echo "This script only runs on AMD or Intel (x86_64) CPUs, not on $architecture."
    exit 1
fi

# Function to display animated title
animate_title() {
    local text="BATOCERA PRO APP INSTALLER"
    local delay=0.1
    local length=${#text}

    for (( i=0; i<length; i++ )); do
        echo -n "${text:i:1}"
        sleep $delay
    done
    echo
}

# Function to display controls
display_controls() {
    echo 
    echo "  This Will install Batocera Pro app Installer to Ports"
    echo    
    sleep 5  # Delay for 5 seconds
}

# Main script execution
clear
animate_title
display_controls




# Check if /userdata/system/pro does not exist and create it if necessary
if [ ! -d "/userdata/system/pro" ]; then
    mkdir -p /userdata/system/pro
fi

# Download pro.sh to /userdata/system/pro
curl -L https://github.com/leponot/batocera.pro/raw/main/app/pro.sh -o /userdata/system/pro/pro.sh

# Download BatoceraPRO.sh to /userdata/roms/ports
curl -L https://github.com/leponot/batocera.pro/raw/main/app/BatoceraPRO.sh -o /userdata/roms/ports/BatoceraPRO.sh

# Download BatoceraPRO.sh.keys to /userdata/roms/ports
wget  https://github.com/leponot/batocera.pro/raw/main/app/bkeys.txt -P /userdata/roms/ports/

# Set execute permissions for the downloaded scripts
chmod +x /userdata/system/pro/pro.sh
chmod +x /userdata/roms/ports/BatoceraPRO.sh


killall -9 emulationstation

sleep 1

mv /userdata/roms/ports/bkeys.txt /userdata/roms/ports/BatoceraPRO.sh.keys


echo "Finished.  You should see BatoceraPRO in Ports"
