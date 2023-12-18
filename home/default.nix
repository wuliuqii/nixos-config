{ config, ... }:
let
  user = config.machine.userName;
in
{
  imports = [
    ./editor
    ./programs
    ./shell
    ./terminal
    ./wayland
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    sessionVariables = {
      EDITOR = "hx";
      BROWSER = "firefox";
      TERMINAL = "foot";
    };
  };

  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "24.05";
}
