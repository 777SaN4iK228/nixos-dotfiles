{ config, pkgs, ... }:

{
  home.username = "dick";
  home.homeDirectory = "/home/dick";
  home.stateVersion = "26.05";

  # ─────────────────────────────────────────────
  # Dotfiles linking
  # ─────────────────────────────────────────────

  home.file.".config/hypr".source = ./dotfiles/hypr;
  home.file.".config/kitty".source = ./dotfiles/kitty;
  home.file.".config/rofi".source = ./dotfiles/rofi;
  home.file.".config/waybar".source = ./dotfiles/waybar;

  home.file.".zprofile".source = ./dotfiles/.zprofile;
  home.file.".zshrc".source = ./dotfiles/.zshrc;

  home.file.".local/bin".source = ./bin;

  # ─────────────────────────────────────────────
  # Hyprland
  # ─────────────────────────────────────────────

  wayland.windowManager.hyprland = {
    enable = true;
  };

  # ─────────────────────────────────────────────
  # Waybar
  # ─────────────────────────────────────────────

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };

  # ─────────────────────────────────────────────
  # Kitty terminal
  # ─────────────────────────────────────────────

  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
  };

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
