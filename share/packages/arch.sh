#!/bin/bash

# ============================================
# 🎯 Daftar Package
# ============================================

packages=(
  # === Tools Umum ===
  "firefox"         # Browser
  "wget"            # download tool
  "unzip"           # unzip files
  "git"             # version control
  "jq"              # JSON processor
  "gum"             # command line UI toolkit
  "fastfetch"       # system information tool

  # === File Editor ===
  "vim"             # text editor
  "neovim"          # modern text editor

  # === File Manager ===
  "ranger"          # File Manager Like NVIM
  "thunar"          # File manager ringan (XFCE)


  # === App Manager ===
  "flatpak"         # Alternatif package manager (sandboxed)

  # === Font ===
  "ttf-font-awesome"
  "ttf-fira-sans"
  "ttf-fira-code"
  "ttf-firacode-nerd"

  # === Display Manager & WM ===
  "hyprland"                      # Wayland compositor
  "xdg-desktop-portal-hyprland"   # xdg portal untuk Hyprland
  "qt5-wayland"                   # Qt support for Wayland
  "qt6-wayland"                   # Qt support for Wayland

  # === Aplikasi GUI & System ===
  "kitty"           # Terminal modern dan cepat
  "alacritty"       # Terminal GPU-accelerated
  "pavucontrol"     # GUI audio control
  "qjackctl"        # GUI control untuk JACK server
  "dunst"           # Sistem notifikasi ringan
  "brightnessctl"   # Kontrol kecerahan
  "networkmanager"  # Manajemen jaringan (WiFi/Ethernet)

  # === Audio / Media ===
  "pipewire-jack"   # JACK support via PipeWire
  "pipewire-alsa"   # ALSA support via PipeWire
  "pipewire-pulse"  # PulseAudio replacement via PipeWire
  "wireplumber"     # Session manager PipeWire
  "pamixer"         # CLI audio mixer

  # === Bar, Menu, Lock ===
  "eww"             # Widget bar / status bar
  "wofi"            # Wayland app launcher
  "hyprpaper"       # Wallpaper manager
  "wlogout"         # GUI logout menu
  "hyprlock"        # Lock screen Hyprland

  # === Screenshot ===
  "grim"            # Alat screenshot untuk Wayland
  "slurp"           # Area selector (buat grim)

  # === Monitoring ===
  "nvtop"           # Monitor GPU usage (mirip htop)
)
