{
  lib,
  config,
  ...
}:
let
  font_family = "${config.profile.font} 10";
in

lib.mkIf config.optional.hypr.enable {
  catppuccin.hyprlock.enable = true;
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        # disable_loading_bar = true;
        hide_cursor = false;
        grace = 5;
        # no_fade_in = true;
      };

      background = [
        {
          monitor = "";
          path = "${config.profile.wallpaper}"; # Only png supported
          # path = "screenshot";
          blur_passes = 3; # 0 disables blur
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];

      input-field = [
        {
          monitor = "eDP-1";
          size = "280, 80";
          outline_thickness = 2;
          outer_color = "$base";
          inner_color = "$base";
          font_color = "$text";
          fade_on_empty = false;
          placeholder_text = "<i>$PROMPT</i>";
          dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          hide_input = false;
          position = "0, -120";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        # Current time
        {
          monitor = "";
          text = "$TIME";
          inherit font_family;
          font_size = 120;
          color = "$text";
          position = "0, -300";
          valign = "top";
          halign = "center";
        }

        # User
        {
          monitor = "";
          text = ''Hi <i><span foreground="##$pinkAlpha">$USER</span></i> :)'';
          font_family = "Roboto";
          font_size = 35;
          color = "$overlay0";
          position = "0, -40";
          valign = "center";
          halign = "center";
        }
      ];
    };
  };
}
