{ pkgs, ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        app-id = "foot";
        title = "foot";
        locked-title = "no";
        font = "JetBrainsMono Nerd Font:size=13";
        include = "${pkgs.foot.themes}/share/foot/themes/catppuccin";
        pad = "0x0 center";
        term = "xterm-256color";
        notify = "notify-send -a \${app-id} -i \${app-id} \${title} \${body}";
        selection-target = "clipboard";
        dpi-aware = "yes";
        vertical-letter-offset = "-0.75";
        resize-delay-ms = 100;
      };
      mouse = {
        hide-when-typing = "yes";
      };
      scrollback = {
        lines = 10000;
        multiplier = 3;
      };

      url = {
        launch = "xdg-open \${url}";
        label-letters = "sadfjklewcmpgh";
        osc8-underline = "url-mode";
        protocols = "http, https, ftp, ftps, file";
        uri-characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.,~:;/?#@!$&%*+=\"'()[]";
      };

      cursor = {
        style = "beam";
        beam-thickness = 1;
      };

      colors = {
        alpha = "0.8";
      };
    };
  };
}
