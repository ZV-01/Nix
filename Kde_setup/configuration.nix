{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Boot configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Networking
  networking.hostName = "Nyx";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  time.timeZone = "Asia/Kolkata";

  # User configuration
  users.users.Haze = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "input" "pipewire"];
  };

  # Enable KDE Plasma 6
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Sound and Services
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    wireplumber.enable = true;
  };
  services.xserver.xkb.layout = "us";
  services.libinput.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.dbus.enable = true;

  # Hardware
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Portals - Switched to KDE for native metadata handling
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
    xdgOpenUsePortal = true;
  };

  # System-wide packages
  environment.systemPackages = with pkgs; [
    # System Tools
    vim wget kitty git btop starship gvfs unrar 
    shared-mime-info # Database for file types

    # Apps
    chromium brave obs-studio spotify neovim vscode 
    telegram-desktop vlc gimp3 localsend discord-canary 
    qbittorrent protonvpn-gui libreoffice-fresh
    
    # Utilities
    unzip corefonts
  ];

  # Global variables
  environment.variables = {
    NIXOS_OZONE_WL = "1"; # Ensures Electron apps use Wayland correctly
  };

  # Nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  nixpkgs.config.allowUnfree = true;

  # Fonts
  fonts.packages = with pkgs; [
    inter noto-fonts noto-fonts-color-emoji fira-code nerd-fonts.fira-code
  ];

  system.stateVersion = "25.05";
}