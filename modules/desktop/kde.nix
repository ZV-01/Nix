{ pkgs, ... }:
{
  # Enable KDE Plasma 6
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # KDE Packages & Polonium
  environment.systemPackages = with pkgs; [
    
    # Utilities that fit KDE
    kitty               # Terminal
    firefox             # Browse
    vscode
    # kate                # Text Editor
    # spectacle           # Screenshot
    # dolphin             # File Manager
    # ark                 # Archive Manager
    
    # Media
    vlc
  ];
  
  # Remove pre-installed bloat (Optional)
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    gwenview
    okular
  ];
}
