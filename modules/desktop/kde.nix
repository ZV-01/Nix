{ pkgs, ... }:
{
  # Enable KDE Plasma 6
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  # Enable Avahi for mDNS/Bonjour
  services.avahi = {
    enable = true;
    nssmdns4 = true;  # Enable mDNS for IPv4
    publish = {
      enable = true;      # Allow publishing services
      userServices = true; # Allow non-root users to publish
      addresses = true;
      domain = true;
    };
  };

  # Open firewall for mDNS
  networking.firewall = {
    allowedUDPPorts = [ 5353 ];  # mDNS port
  };


  # KDE Packages & Polonium
  environment.systemPackages = with pkgs; [
    
    # Utilities that fit KDE
    kitty               # Terminal
    firefox             # Browse
    vscode
    discord-canary
    # kate                # Text Editor
    # spectacle           # Screenshot
    # dolphin             # File Manager
    # ark                 # Archive Manager
    
    # Media
    vlc
    starship
    antigravity-fhs
  ];
  
  # Remove pre-installed bloat (Optional)
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    gwenview
    okular
  ];
}
