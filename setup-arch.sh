#!/usr/bin/env bash

# ----------------------------------------------------------
# Packages
# ----------------------------------------------------------

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source $SCRIPT_DIR/share/packages/arch.sh

# (🔧 Tambahan) Source AUR package list
AUR_PKG_FILE="$SCRIPT_DIR/share/packages/aur-package.sh"
if [[ -f "$AUR_PKG_FILE" ]]; then
    source "$AUR_PKG_FILE"
else
    echo ":: WARNING: File aur-package.sh tidak ditemukan. Lewati AUR tambahan."
    aur_packages=()
fi

# ----------------------------------------------------------
# Colors
# ----------------------------------------------------------

GREEN='\033[0;32m'
NONE='\033[0m'

# ----------------------------------------------------------
# Check if command exists
# ----------------------------------------------------------

_checkCommandExists() {
    cmd="$1"
    if ! command -v "$cmd" >/dev/null; then
        echo 1
        return
    fi
    echo 0
    return
}

# ----------------------------------------------------------
# Check if package is already installed
# ----------------------------------------------------------

_isInstalled() {
    package="$1"
    check="$(pacman -Qq "${package}" 2>/dev/null)"
    if [ -n "${check}" ]; then
        echo 0
        return
    fi
    echo 1
    return
}

# ----------------------------------------------------------
# Install yay
# ----------------------------------------------------------

_installYay() {
    _installPackages "base-devel"
    SCRIPT=$(realpath "$0")
    temp_path=$(dirname "$SCRIPT")
    git clone https://aur.archlinux.org/yay.git "$download_folder/yay"
    cd "$download_folder/yay"
    makepkg -si
    cd "$temp_path"
    echo ":: yay has been installed successfully."
}

# ----------------------------------------------------------
# Install packages (via yay)
# ----------------------------------------------------------

_installPackages() {
    toInstall=()
    for pkg; do
        if [[ $(_isInstalled "${pkg}") == 0 ]]; then
            echo ":: ${pkg} is already installed."
            continue
        fi
        toInstall+=("${pkg}")
    done
    if [[ "${#toInstall[@]}" -eq 0 ]]; then
        return
    fi
    printf "🔧 Menginstall package berikut:\n%s\n" "${toInstall[@]}"
    yay --noconfirm -S "${toInstall[@]}"
}

# ----------------------------------------------------------
# Header
# ----------------------------------------------------------

clear
echo -e "${GREEN}"
cat <<"EOF"
   ____    __          
  / __/__ / /___ _____ 
 _\ \/ -_) __/ // / _ \
/___/\__/\__/\_,_/ .__/
                /_/    
ML4W Hyprland Starter for Arch based distros
EOF
echo -e "${NONE}"

# ----------------------------------------------------------
# Content
# ----------------------------------------------------------

while true; do
    read -p "DO YOU WANT TO START THE PACKAGE INSTALLATION NOW? (Yy/Nn): " yn
    case $yn in
        [Yy]*)
            echo ":: Installation started."
            echo
            break
            ;;
        [Nn]*)
            echo ":: Installation canceled"
            exit
            ;;
        *)
            echo ":: Please answer yes or no."
            ;;
    esac
done

# Install yay if needed
if [[ $(_checkCommandExists "yay") == 0 ]]; then
    echo ":: yay is already installed"
else
    echo ":: The installer requires yay. yay will be installed now"
    _installYay
fi

# Install main packages (from arch.sh)
_installPackages "${packages[@]}"

# 🔧 Install additional AUR packages (from aur-package.sh)
if [[ ${#aur_packages[@]} -gt 0 ]]; then
    echo ":: Installing additional AUR packages from aur-package.sh..."
    _installPackages "${aur_packages[@]}"
else
    echo ":: No additional AUR packages to install."
fi

# ----------------------------------------------------------
# Completed
# ----------------------------------------------------------

echo ":: Installation complete."
echo ":: Ready to install the dotfiles with the Dotfiles Installer."