{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core         # Core system settings
    ../../modules/desktop/kde.nix  # Your Desktop Environment
  ];

  networking.hostName = "Nyx";

  # Define User
  users.users.Haze = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
    shell = pkgs.bash;
  };

  # System State Version
  system.stateVersion = "24.11"; 
}