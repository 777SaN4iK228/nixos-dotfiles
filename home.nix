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

  home.file.".local/bin".source = ./bin;
  home.file.".config/hypr/.luarc.json".enable = false;
  home.file.".local/bin/push".source = ./bin/push;


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
