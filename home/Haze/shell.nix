  { pkgs, ... }:
  {
    # Shell configuration
    programs.bash = {
        enable = true;
        bashrcExtra = ''
        eval "$(starship init bash)"
        alias rebuild='sudo nixos-rebuild switch --flake ~/Nix/single_user#Nyx'
        '';
    };
  }