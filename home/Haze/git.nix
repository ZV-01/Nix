{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user.name = "Zettanox";
      user.email = "amiteshrawal1@gmail.com";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
}