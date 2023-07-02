{ pkgs, ... }:
{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "JetBrainsMono Nerd Font:size=14";
        dpi-aware = "yes";
        include = "${pkgs.foot.themes}/share/foot/themes/nord";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
