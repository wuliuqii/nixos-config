{ config, ... }:
let
  user = config.profile.userName;
  editor = config.profile.editor;
in
{
  imports = [
    ./editors
    ./programs
    ./shell
    ./terminals
    ./secrets

    ./hypr
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${config.profile.userName}";

    sessionVariables = {
      EDITOR = "${editor}";
      BROWSER = "${config.profile.browser}";
      TERMINAL = "${config.profile.terminal}";
    };

  };

  catppuccin = {
    # enable = true;
    accent = "mauve";
    flavor = "macchiato";
  };

  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "24.05";
}
