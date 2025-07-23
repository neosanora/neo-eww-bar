#!/bin/bash
sleep 1

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

_checkCommandExists() {
    cmd="$1"
    if ! command -v "$cmd" >/dev/null; then
        echo 1
        return
    fi
    echo 0
    return
}

_selectDistribution() {

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
ML4W Hyprland Starter

EOF
    echo -e "${NONE}"
    
    echo ":: Distribution could not be auto detected. Please select your base distribution."
    echo 
    echo "1: Arch (pacman + aur helper)"
    echo "2: Fedora (dnf)"
    echo "3: Show dependencies and install manually for your distribution"
    echo "4: Cancel"
    echo 
    while true; do
        read -p "Plase select: " yn
        case $yn in
            1)
                $SCRIPT_DIR/setup-arch.sh
                break
                ;;
            2)
                $SCRIPT_DIR/setup-fedora.sh
                break
                ;;
            3)
                $SCRIPT_DIR/dependencies.sh
                break
                ;;
            4)
                echo ":: Installation canceled"
                exit
                break
                ;;
            *)
                echo ":: Please select a valid option."
                ;;
        esac
    done    
    }

if [[ $(_checkCommandExists "pacman") == 0 ]]; then
    bash "$SCRIPT_DIR/setup-arch.sh"
elif [[ $(_checkCommandExists "dnf") == 0 ]]; then
    $SCRIPT_DIR/setup-fedora.sh
else
    $SCRIPT_DIR/dependencies.sh
fi