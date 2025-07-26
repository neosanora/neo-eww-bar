#!/bin/bash

# ============================================
# 🎯 Daftar Package
# ============================================

packages=(
  # === Tools Umum ===
  "wget"            # download tool
  "unzip"           # unzip files
  "git"             # version control
  "jq"              # JSON processor
  "vim"             # text editor
  "neovim"          # modern text editor
  "gum"             # command line UI toolkit
  "fastfetch"       # system information tool

  # === Font ===
  "ttf-font-awesome"
  "ttf-fira-sans"
  "ttf-fira-code"
  "ttf-firacode-nerd"

  # === Display Manager & WM ===
  "hyprland"                       # Wayland compositor
  "xdg-desktop-portal-hyprland"   # xdg portal untuk Hyprland
  "qt5-wayland"                   # Qt support for Wayland
  "qt6-wayland"                   # Qt support for Wayland

  # === Aplikasi GUI & System ===
  "kitty"           # Terminal modern dan cepat
  "alacritty"       # Terminal GPU-accelerated
  "thunar"          # File manager ringan (XFCE)
  "firefox"         # Browser
  "pavucontrol"     # GUI audio control
  "qjackctl"        # GUI control untuk JACK server
  "dunst"           # Sistem notifikasi ringan
  "wlogout"         # GUI logout menu
  "flatpak"         # Alternatif package manager (sandboxed)

  # === Audio / Media ===
  "pipewire-jack"   # JACK support via PipeWire
  "pipewire-alsa"   # ALSA support via PipeWire
  "pipewire-pulse"  # PulseAudio replacement via PipeWire
  "wireplumber"     # Session manager PipeWire
  "brightnessctl"   # Kontrol kecerahan
  "networkmanager"  # Manajemen jaringan (WiFi/Ethernet)
  "pamixer"         # CLI audio mixer

  # === Bar, Menu, Lock ===
  "eww"             # Widget bar / status bar
  "wofi"            # Wayland app launcher
  "hyprpaper"       # Wallpaper manager
  "hyprlock"        # Lock screen Hyprland

  # === Screenshot ===
  "grim"            # Alat screenshot untuk Wayland
  "slurp"           # Area selector (buat grim)

  # === Monitoring ===
  "nvtop"           # Monitor GPU usage (mirip htop)
)
