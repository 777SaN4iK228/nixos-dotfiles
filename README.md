# 🧩 NixOS Dotfiles

## 1️⃣ Commands
| Command | Description |
|----------|--------------|
| **/config** | Opens `configuration.nix` located in `~/nixos-dotfiles` |
| **/hyprconfig** | Opens `hyprland.conf` located in `~/nixos-dotfiles/dotfiles/hypr` |
| **/steam-x11** | Launches Steam with X11 option |
| **/update** | Runs `sudo nixos-rebuild switch --flake ~/nixos-dotfiles` |
| **/push** | Runs `git add . && git commit -m "update" && git push` |

---

## 2️⃣ Structure

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


---

## 3️⃣ My System
- Flake  
- Home Manager  
- Dotfiles  
- Scripts  

---

## 4️⃣ Minimal System Requirements (recommended)
| Component | Spec |
|------------|------|
| **CPU** | 2 cores @ 2 GHz |
| **RAM** | 4 GB |
| **Storage** | 30 GB |
| **Computer** | Turns on 😄 |

---

## 5️⃣ Notes
Just my personal NixOS setup — clean, modular, and flake‑based.
