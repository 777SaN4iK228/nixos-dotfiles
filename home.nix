{ config, pkgs, ... }:

{
  home.username = "dick";
  home.homeDirectory = "/home/dick";
  home.stateVersion = "26.05";

  # ─────────────────────────────────────────────
  # Dotfiles linking (Direct Nix-Store Copy)
  # ─────────────────────────────────────────────

  home.file.".config/hypr".source = ./dotfiles/hypr;
  home.file.".config/kitty".source = ./dotfiles/kitty;
  home.file.".config/rofi".source = ./dotfiles/rofi;
  home.file.".config/waybar".source = ./dotfiles/waybar;

  home.file.".zprofile".source = ./dotfiles/.zprofile;
  home.file.".zshrc".source = ./dotfiles/.zshrc;

  home.file.".config/hypr/.luarc.json".enable = false;

  # Define each file individually with execute permissions
  home.file.".local/bin/push" = { source = ./bin/push; executable = true; };
  home.file.".local/bin/hyprconfig" = { source = ./bin/hyprconfig; executable = true; };
  home.file.".local/bin/config" = { source = ./bin/config; executable = true; };
  home.file.".local/bin/update" = { source = ./bin/update; executable = true; };
  home.file.".local/bin/steam-x11" = { source = ./bin/steam-x11; executable = true; };

  # ─────────────────────────────────────────────
  # Packages
  # ─────────────────────────────────────────────

  home.packages = with pkgs; [
    fastfetch
    btop
    git
    wget
    curl
    unzip
    pavucontrol
    nerd-fonts.jetbrains-mono
  ];

  # ─────────────────────────────────────────────
  # Fonts
  # ─────────────────────────────────────────────

  fonts.fontconfig.enable = true;

  # ─────────────────────────────────────────────
  # GTK theme
  # ─────────────────────────────────────────────

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  # ─────────────────────────────────────────────
  # Environment variables
  # ─────────────────────────────────────────────

  home.sessionVariables = {
    EDITOR = "nano";
    TERMINAL = "kitty";
  };
}
