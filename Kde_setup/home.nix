{ config, pkgs, inputs, ... }:

{
  home.username = "Haze";
  home.homeDirectory = "/home/Haze";
  home.stateVersion = "25.05";

  # KDE manages theming, but we keep the custom cursor for consistency
  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 13;
    gtk.enable = true;
    x11.enable = true;
  };

  # Enable font configuration for user apps
  fonts.fontconfig.enable = true;

  # Shell configuration
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      eval "$(starship init bash)"
      alias rebuild='sudo nixos-rebuild switch --flake ~/Nix/single_user#Nyx'
    '';
  };

  # Simplified Dotfiles - stripped Hyprland/Waybar/Mako/Sway
  xdg.configFile = {
    "kitty/kitty.conf".source = inputs.self + "/dotfiles/kitty/kitty.conf";
    "starship.toml".source = inputs.self + "/dotfiles/starship.toml";
  };

  programs.home-manager.enable = true;
}