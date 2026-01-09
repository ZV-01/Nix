{ config, pkgs, inputs, ... }:
let
  # The path to your repo (Adjust "Haze" if your username differs)
  dotfilesPath = "../hosts/Nyx/dotfiles"; 
in
{
  imports = [
    ./Haze/git.nix
  ];

  home.username = "Haze";
  home.homeDirectory = "/home/Haze";
  home.stateVersion = "24.11";

  # The "Instant Update" Symlink Trick
  # 1. Clone your dotfiles into ~/nix-config/dotfiles
  # 2. Link them here
  xdg.configFile = {
    "kitty/kitty.conf".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/kitty/kitty.conf";
    # "starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/dotfiles/starship.toml";
  };
  
  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}