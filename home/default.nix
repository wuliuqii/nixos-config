{ lib, config, ... }:
let
  user = config.machine.userName;
  editor = config.machine.editor;
in
{
  imports = [
    ./editors
    ./programs
    ./shell
    ./terminals
    ./secrets

    # ./hypr
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${config.machine.userName}";

    sessionVariables = {
      EDITOR = "${editor}";
      BROWSER = "${config.machine.browser}";
      TERMINAL = "${config.machine.terminal}";
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
