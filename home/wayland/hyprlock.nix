{ config, ... }:
let
  font_family = "JetBrains Mono 10";
in
{
  programs.hyprlock = {
    enable = true;

    settings = {
      source = "~/.config/hypr/macchiato.conf";

      general = {
        disable_loading_bar = true;
        hide_cursor = false;
        no_fade_in = true;
      };

      background = [
        {
          monitor = "";
          path = "${config.machine.wallpaper}"; # Only png supported

          blur_size = 4;
          blur_passes = 3; # 0 disables blur
          noise = 0.0117;
          contrast = 1.3000; # Vibrant!!!
          brightness = 0.8000;
          vibrancy = 0.2100;
          vibrancy_darkness = 0.0;
        }
      ];

      input-field = [
        {
          monitor = "eDP-1";
          size = "250, 50";

          outline_thickness = 3;
          outer_color = "$base";
          inner_color = "$base";
          font_color = "$text";
          fade_on_empty = true;
          placeholder_text = "<i>Password...</i>"; # Text rendered in the input box when it's empty
          dots_size = 0.26; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.64; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          hide_input = false;

          position = "0, 60";
          halign = "center";
          valign = "bottom";
        }
      ];

      label = [
        # Current time
        {
          monitor = "";
          text = "cmd[update:1000] echo \"<b><big> $(date +\"%H:%M:%S\")</big></b>\"";
          inherit font_family;
          font_size = 64;
          color = "$text";
          shadow_passes = 3;
          shadow_size = 4;

          position = "0, 40";

          valign = "center";
          halign = "center";
        }

        # Date
        {
          monitor = "";
          text = "cmd[update:18000000] echo \"<b> $(date +\"%A, %-d %B %Y\")</b>\"";
          inherit font_family;
          font_size = 24;
          color = "$overlay0";
          position = "0, 0";
          valign = "center";
          halign = "center";

        }

        # User
        {
          monitor = "";
          text = "Hey $USER";
          font_family = "Roboto";
          font_size = 18;
          color = "$overlay0";
          position = "0, 20";
          valign = "bottom";
          halign = "center";
        }
      ];
    };
  };
}
