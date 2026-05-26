{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  ################
  # Bootloader
  ################

  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    useOSProber = true;
    default = "saved";
  };
  

  ################
  # Networking
  ################

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  ################
  # Time / Locale
  ################

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  ################
  # Virtualisation
  ################

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  ################
  # Disks / mounts
  ################

  services.udisks2.enable = true;
  services.gvfs.enable = true;

  fileSystems."/mnt/games1" = {
    device = "/dev/disk/by-uuid/11013007-ce61-413e-9dd1-b19563cba234";
    fsType = "ext4";
    options = [ "nofail" ];
  };

  fileSystems."/mnt/games2" = {
    device = "/dev/disk/by-uuid/f34bd9a6-97b1-41df-8834-ec16be76464d";
    fsType = "ext4";
    options = [ "nofail" ];
  };

  fileSystems."/mnt/games3" = { 
    device = "/dev/disk/by-uuid/5a56a01a-4344-4234-b848-99217b721830";
    fsType = "ext4";
    options = [ "nofail" ];
  };

  fileSystems."/mnt/games4" = {
    device = "/dev/disk/by-uuid/2fd0890e-4872-4b7f-9799-c7c02fa09d2f";
    fsType = "ext4";
    options = [ "nofail" ];
  };

  fileSystems."/mnt/games5" = {
    device = "/dev/disk/by-uuid/634f8a94-2660-4c16-92c7-6307c8a2f863";
    fsType = "ext4";
    options = [ "nofail" ];
  };

  ################
  # User
  ################

  users.users.dick = {
    isNormalUser = true;
    description = "dick";
    extraGroups = [ "adbusers" "networkmanager" "wheel" "podman" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };

  services.getty.autologinUser = "dick";

  ################
  # Shell / programs
  ################

  programs.nm-applet.enable = true;
  programs.steam.enable = true;

  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
  };

  ################
  # Fonts
  ################  

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    noto-fonts-color-emoji
  ];

  ################
  # Nix settings
  ################

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  ################
  # Session env
  ################

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    KITTY_ENABLE_WAYLAND = "1";
    KWIN_DRM_DEVICES = "/dev/dri/card0";
    __GL_GSYNC_ALLOWED = "0";
    __GL_VRR_ALLOWED = "0";
  };

  ################
  # Graphics / NVIDIA
  ################

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  boot.kernelParams = [
    "nvidia_drm.modeset=1"
    "nvidia_drm.fbdev=1"
  ];

  hardware.nvidia = {
    open = true;
    powerManagement.enable = true;
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  ################  
  # Zsh
  ################

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  ################
  # Keyboard
  ################

  services.xserver.xkb = {
    layout = "us";
    variant = ""; 
  };

  ################
  # Unfree
  ################

  nixpkgs.config.allowUnfree = true;

  ################
  # Services
  ################

  services.power-profiles-daemon.enable = true;
  services.dbus.enable = true;
  hardware.sensor.iio.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;

  ################
  # Packages
  ################

  environment.systemPackages = with pkgs; [
    vim
    neovim
    p7zip
    rofi
    rofi-bluetooth
    networkmanager_dmenu
    kitty
    git
    zsh
    sysstat
    yad
    kdePackages.ark
    peazip
    swaynotificationcenter
    parted
    gcc
    gnumake
    pkg-config
    libX11
    libXft
    libXinerama

    # Changed python315 to python3 as 3.15 does not exist yet
    python3
    hyprpaper
    hyprlock
    waybar
    tty-clock
    btop
    fastfetch
    uwufetch
    cmatrix
    cava
    asciiquarium  
    element
    element-desktop
    grim
    slurp
    vscodium

    kdePackages.dolphin
    kdePackages.kio
    kdePackages.kio-extras

    discord 
    telegram-desktop
    anydesk

    firefox
    tor-browser
    cbonsai

    networkmanager
    pulseaudio
    pipewire
    wl-clipboard
    iio-sensor-proxy
    lm_sensors
    bluez
    pamixer
    pavucontrol

    steam
    heroic
    prismlauncher
    openrgb
    gamemode
    alvr
    sidequest
    usbutils

    vulkan-tools
    vulkan-loader
    vkd3d-proton
    mesa
  ];

  ################
  # System state
  ################

  # Adjusted to match unstable's actual state target baseline if needed
  system.stateVersion = "26.05"; 
}
