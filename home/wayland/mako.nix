{ pkgs, ... }:
{
  services.mako = {
    enable = true;
    layer = "top";
    markup = true;
    anchor = "top-right";
    width = 450;
    height = 200;
    margin = "20,20,0";
    padding = "15,15,15";
    borderSize = 2;
    borderRadius = 15;
    maxIconSize = 96;
    icons = true;
    iconPath = "${pkgs.catppuccin-papirus-folders}/share/icons/Papirus";
    backgroundColor = "#1E1E28";
    borderColor = "#a4b9ef";
    progressColor = "over #332E41";
    textColor = "#DADAE8";
    defaultTimeout = 10000;
    format = ''<span font="Iosevka Nerd Font weight=325 Italic" size="12288">%s</span>\n<span font="JetBrainsMono Nerd Font weight=325" size="12288">%b</span>'';
    groupBy = "summary";
    extraConfig = ''
      [grouped]
      format=<span font="Iosevka Nerd Font weight=325 Italic" size="12288">%s</span>\n<span font="JetBrainsMono Nerd Font weight=325" size="12288">%b</span>

      [mode=do-not-disturb]
      invisible=1
    '';
  };
}
