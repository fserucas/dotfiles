#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SERVICE_FILE="$SCRIPT_DIR/home/.config/systemd/user/kanata.service"
SYSTEM_SERVICE="/etc/systemd/system/kanata.service"
USER_HOME="$(eval echo ~$USER)"

show_usage() {
    echo "Usage: $0 {add|delete}"
    echo "  add    - Install kanata service as system service"
    echo "  delete - Remove kanata system service"
    exit 1
}

install_service() {
    echo "Installing kanata system service..."

    # Stop and disable user service if it exists
    if systemctl --user is-active --quiet kanata.service 2>/dev/null; then
        echo "Stopping user kanata service..."
        systemctl --user stop kanata.service
    fi

    if systemctl --user is-enabled --quiet kanata.service 2>/dev/null; then
        echo "Disabling user kanata service..."
        systemctl --user disable kanata.service
    fi

    # Copy service file to system location
    echo "Copying service file to system location..."
    sudo cp "$SERVICE_FILE" "$SYSTEM_SERVICE"

    # Update service file with absolute config path
    echo "Updating service file with absolute config path..."
    sudo sed -i "s|%h/.kanata.conf|$USER_HOME/.kanata.conf|" "$SYSTEM_SERVICE"

    # Reload systemd and enable service
    echo "Enabling and starting system service..."
    sudo systemctl daemon-reload
    sudo systemctl enable kanata.service
    sudo systemctl start kanata.service

    echo "Kanata system service installed and started successfully!"
    echo "Status:"
    sudo systemctl status kanata.service --no-pager -l
}

remove_service() {
    echo "Removing kanata system service..."

    # Stop and disable system service
    if sudo systemctl is-active --quiet kanata.service 2>/dev/null; then
        echo "Stopping system kanata service..."
        sudo systemctl stop kanata.service
    fi

    if sudo systemctl is-enabled --quiet kanata.service 2>/dev/null; then
        echo "Disabling system kanata service..."
        sudo systemctl disable kanata.service
    fi

    # Remove service file
    if [ -f "$SYSTEM_SERVICE" ]; then
        echo "Removing system service file..."
        sudo rm "$SYSTEM_SERVICE"
    fi

    # Reload systemd
    sudo systemctl daemon-reload

    echo "Kanata system service removed successfully!"
}

# Check if service file exists
if [ ! -f "$SERVICE_FILE" ]; then
    echo "Error: Service file not found at $SERVICE_FILE"
    exit 1
fi

# Parse command line argument
case "$1" in
    add)
        install_service
        ;;
    delete)
        remove_service
        ;;
    *)
        show_usage
        ;;
esac