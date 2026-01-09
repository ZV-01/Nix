{ pkgs, ... }:
{
  programs.hyprland.enable = true;
  
  environment.systemPackages = with pkgs; [
    hyprsunset
    hyprlock
    hypridle
    hyprpaper
    hyprpolkitagent
  ];
}