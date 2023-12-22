{ config, ... }:
let
  user = config.machine.userName;
in
{
  imports = [
    ./editors
    ./programs
    ./shell
    ./terminals
    ./wayland
    ./services
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${config.machine.userName}";

    sessionVariables = {
      EDITOR = "hx";
      BROWSER = "${config.machine.browser}";
      TERMINAL = "${config.machine.terminal}";
    };
  };

  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "24.05";
}
