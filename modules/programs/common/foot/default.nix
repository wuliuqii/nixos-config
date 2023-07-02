{ config, pkgs, ... }:
{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "Jetbrains Mono Nerd:size=16";
        dpi-aware = "yes";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
