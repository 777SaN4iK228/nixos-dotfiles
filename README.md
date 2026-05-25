# 🧩 NixOS Dotfiles

A clean, modular, flake‑based NixOS configuration with Hyprland, Home Manager, and fully managed dotfiles.  
Everything is reproducible, version‑controlled, and script‑automated.

---

## 1️⃣ Commands

| Command | Description |
|--------|-------------|
| **/config** | Opens `configuration.nix` in `~/nixos-dotfiles` |
| **/hyprconfig** | Opens `hyprland.conf` in `dotfiles/hypr` |
| **/steam-x11** | Launches Steam using X11 |
| **/update** | Runs `sudo nixos-rebuild switch --flake ~/nixos-dotfiles` |
| **/push** | Runs `git add . && git commit -m "update" && git push` |

---

## 2️⃣ Structure

```bash
~/nixos-dotfiles/
├── bin/
│   ├── push
│   ├── config
│   ├── hyprconfig
│   ├── steam-x11
│   └── update
├── dotfiles/
│   ├── hypr/
│   │   ├── hypridle.conf
│   │   ├── hyprland.conf
│   │   ├── hyprlock.conf
│   │   └── hyprpaper.conf
│   ├── kitty/
│   │   ├── diff.conf
│   │   └── kitty.conf
│   ├── rofi/
│   │   ├── config.rasi
│   │   ├── config.rasi.save
│   │   └── themes/
│   │       └── tokionight_big2.rasi
│   ├── waybar/
│   │   ├── scripts/
│   │   ├── config.jsonc
│   │   ├── modules.json
│   │   └── style.css
│   ├── .zprofile
│   └── .zshrc
├── configuration.nix
├── hardware-configuration.nix
├── flake.nix
├── home.nix
├── flake.lock
└── Wallpaper.png

3️⃣ What’s Inside

    Flake-based system

    Home Manager integration

    Hyprland setup

    Waybar, Rofi, Kitty configs

    Custom scripts for workflow automation

    Fully reproducible dotfiles

4️⃣ Recommended System Requirements
Component	Minimum
CPU	2 cores @ 2 GHz
RAM	4 GB
Storage	30 GB
Computer	Must turn on 😄

5️⃣ Notes

This repo contains my personal NixOS setup.
Feel free to explore, fork, or use it as inspiration for your own config.
