{ config, ... }:
let
  font_family = "Inter";
in
{
  programs.hyprlock = {
    enable = true;

    # general.hide_cursor = false;

    backgrounds = [
      {
        monitor = "";
        path = "${config.machine.wallpaper}";
      }
    ];

    input-fields = [
      {
        monitor = "eDP-1";

        size = {
          width = 300;
          height = 50;
        };

        outline_thickness = 2;

        outer_color = "rgb(36, 39, 58)";
        inner_color = "rgb(147, 154, 183)";
        font_color = "rgb(91, 96, 120)";

        fade_on_empty = false;
        placeholder_text = ''<span font_family="${font_family}" foreground="##5b6078">Password...</span>'';

        dots_spacing = 0.3;
        dots_center = true;
      }
    ];

    labels = [
      {
        monitor = "";
        text = "$TIME";
        inherit font_family;
        font_size = 50;
        color = "rgb(36, 39, 58)";

        position = {
          x = 0;
          y = 80;
        };

        valign = "center";
        halign = "center";
      }
    ];
  };
}
