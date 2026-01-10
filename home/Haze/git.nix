{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    
    # Replace with your details
    userName = "Zettanox";
    userEmail = "amiteshrawal1@gmail.com";
    
    # Optional: Modern defaults
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
}