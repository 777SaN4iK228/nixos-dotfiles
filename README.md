/1) Commands
/config - opens configuration.nix located in ~/nixos-dotfiles
/
/hyprconfig opens hyprland.conf located in ~/nixos-dotfiles/dotfiles/hypr
/
/steam-x11 opens steam with x11 launch option
/
/update runs sudo nixos-rebuild switch --flake ~/nixos-dotfiles
/
/push runs cd ~/nixos-dotfiles || exit /git add . /git commit -m "update" /git push 
/
/commits and pushes 
/
/2) Structure
/~/nixos-dotfiles/ bin/
/                  dotfiles/
/                  configuration.nix
/                  flake.nix
/                  home.nix
/                  flake.lock
/                  configuration.nix
/                  hardware-configuration.nix (pls deleate)
/                  push
/                  Wallpaper.png
/
/~/nixos-dotfiles/bin/ push
/                      config
/                      hyprconfig
/                      steam-x11
/                      update
/
/~/nixos-dotfiles/dotfiles hypr/
/                          kitty/
/                          rofi/
/                          waybar/ 
/                          .zprofile
/                          .zshrc
/
/~/nixos-dotfiles/dotfiles/hypr hypridle.conf
/                               hyprland.conf
/                               hyprlock.conf
/                               hyprpaper.conf
/
/~/nixos-dotfiles/dotfiles/kitty diff.conf
/                                kitty.conf
/
/~/nixos-dotfiles/dotfiles/rofi themes/
/                               config.rasi
/                               config.rasi.save
/
/~/nixos-dotfiles/dotfiles/rofi/themes /tokionight_big2.rasi
/
/~/nixos-dotfiles/dotfiles/waybar scripts/
/                                 config.jsonc
/                                 modules.json
/                                 style.css
/
/3) My system
/
/-Flake
/-Home Manager
/-Dotfiles
/-Scripts
/
/4) Minimal system requirements (recomended)
/
/CPU: 2 cores 2ghz 
/RAM: 4 Gb
/Storage: 30 Gb
/Computer: turns on
/
/5) Idk
