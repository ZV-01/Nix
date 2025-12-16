{ config, pkgs, inputs, ... }:

{
  home.username = "Haze";
  home.homeDirectory = "/home/Haze";
  home.stateVersion = "25.05";

  # Shell configuration
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      eval "$(starship init bash)"
      alias rebuild='sudo nixos-rebuild switch --flake ~/Nix/single_user#Nyx'
    '';
  };

  # GTK theming
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Adwaita-dark";
      package = pkgs.adwaita-icon-theme;
    };
  };

  # Qt theming
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "Adwaita-Dark";
  };

  # Cursor theme
  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 13;
    gtk.enable = true;
    x11.enable = true;
  };

  # Enable font configuration
  fonts.fontconfig.enable = true;

  # Home Manager programs management
  programs.home-manager.enable = true;

  # Dotfiles
  xdg.configFile = {
    "waybar/config.jsonc".source = inputs.self + "/dotfiles/waybar/config.jsonc";
    "waybar/style.css".source = inputs.self + "/dotfiles/waybar/style.css";
    "hypr/hyprland.conf".source = inputs.self + "/dotfiles/hypr/hyprland.conf";
    "kitty/kitty.conf".source = inputs.self + "/dotfiles/kitty/kitty.conf";
    "starship.toml".source = inputs.self + "/dotfiles/starship.toml";
    "waypaper/config.ini".source = inputs.self + "/dotfiles/waypaper/config.ini";
    "rofi/config.rasi".source = inputs.self + "/dotfiles/rofi/config.rasi";
    "mako/config".source = inputs.self + "/dotfiles/mako/config";
    "sway/config".source = inputs.self + "/dotfiles/sway/config";
  };
}
