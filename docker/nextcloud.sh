#!/bin/bash


# Check for Docker installation
if ! command -v docker &> /dev/null; then
    dialog --title "Docker Installation" --infobox "Docker could not be found. Installing Docker..." 10 50
    sleep 2 # Gives user time to read the message
    curl -L https://github.com/leponot/batocera.pro/raw/main/docker/install.sh | bash
    # Check if Docker was successfully installed
    if ! command -v docker &> /dev/null; then
        dialog --title "Docker Installation Error" --msgbox "Docker installation failed. Please install Docker manually." 10 50
        clear
        exit 1
    fi
fi

# Function to check if port 443 is in use
is_port_in_use() {
    netstat -tuln | grep ":$1 " > /dev/null
    return $?
}

# Function to find the next available port starting from 443
find_next_available_port() {
    local port=443
    while is_port_in_use $port; do
        port=$((port + 1))
    done
    echo $port
}

# Determine and set the port for Nextcloud
NEXTCLOUD_PORT=$(find_next_available_port)

# Directories for Nextcloud
nextcloud_base_dir="$HOME/nextcloud"
mkdir -p "$nextcloud_base_dir/config" "$nextcloud_base_dir/data"

# Run the Nextcloud Docker container
if [[ "$(docker ps | grep nextcloud)" != "" ]]; then docker stop nextcloud 1>/dev/null 2>/dev/null; fi
docker run --privileged -d \
-p 8888:80 \
-v "$nextcloud_base_dir/config:/config" \
-v "$nextcloud_base_dir/data:/data" \
--restart unless-stopped \
--name nextcloud \
nextcloud

    function linuxserver() {
    docker run -d \
      --name=nextcloud \
      -e PUID=$(id -u) \
      -e PGID=$(id -g) \
      -e TZ=$(cat /etc/timezone) \
      -p $NEXTCLOUD_PORT:443 \
      linuxserver/nextcloud:latest
    }

# Final message with dialog
MSG="Nextcloud Docker container has been set up.\n\nAccess Nextcloud Web UI at https://<your-ip>:8888\nNextcloud data stored in: $nextcloud_base_dir\n"
dialog --title "Nextcloud Setup Complete" --msgbox "$MSG" 15 70

clear
