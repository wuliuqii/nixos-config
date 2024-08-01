{ ... }:
{
  programs.foot = {
    enable = true;
    catppuccin.enable = true;
    settings = {
      main = {
        font = "JetBrains Mono:size=16";
        box-drawings-uses-font-glyphs = "yes";
        pad = "0x0 center";
        notify = "notify-send -a \${app-id} -i \${app-id} \${title} \${body}";
        selection-target = "clipboard";
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
    };
  };
}
