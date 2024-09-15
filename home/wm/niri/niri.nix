{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.optional.niri {
    programs.niri = {
      # enable = true;

      settings = {
        input = {
          # mouse.accel-speed = 0.4;
          touchpad = {
            tap = true;
            dwt = true;
            natural-scroll = true;
            click-method = "clickfinger";
          };
        };

        prefer-no-csd = true;

        hotkey-overlay.skip-at-startup = true;

        environment = {
          QT_QPA_PLATFORM = "wayland";
          DISPLAY = null;
          NIXOS_OZONE_WL = "1";
          XDG_CURRENT_DESKTOP = "niri";
          XDG_SESSION_TYPE = "wayland";
          MOZ_ENABLE_WAYLAND = "1";
          QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        };

        layout = {
          gaps = 8; # px
          # center-focused-column = "on-overflow";
          # center-focused-column = "never";
          # center-focused-column = "always";
          preset-column-widths = [
            { proportion = 1.0 / 3.0; }
            { proportion = 1.0 / 2.0; }
            { proportion = 2.0 / 3.0; }
            { proportion = 1.0; }
          ];
          default-column-width = {
            proportion = 1.0 / 2.0;
          };
          focus-ring = {
            enable = true;
            width = 2;
            active.gradient = {
              from = "#7dc4e4";
              to = "#f5bde6";
              angle = 45;
              relative-to = "workspace-view";
            };
          };
        };

        window-rules = [
          {
            draw-border-with-background = false;
            # draw each corner as rounded with the same radius
            geometry-corner-radius =
              let
                r = 8.0;
              in
              {
                top-left = r;
                top-right = r;
                bottom-left = r;
                bottom-right = r;
              };
            clip-to-geometry = true;
          }
          {
            # dim unfocused windows
            matches = [ { is-focused = false; } ];
            opacity = 0.85;
          }
          {
            matches = [ { app-id = "firefox"; } ];
            open-maximized = true;
          }
          {
            matches = [ { app-id = "neovide"; } ];
            open-maximized = true;
          }
          # { open-maximized = true; }
        ];

        outputs = {
          "eDP-1" = {
            position.y = 0;
            position.x = 0;
            scale = 2.0;
          };

          "DP-3" = {
            scale = 2.0;
            position.x = 1440;
            position.y = 0;
          };
        };

        spawn-at-startup = map (s: { command = pkgs.lib.strings.splitString " " s; }) [
          "fcitx5"
          "ags"
        ];

        animations.shaders.window-resize = ''
          vec4 resize_color(vec3 coords_curr_geo, vec3 size_curr_geo) {
              vec3 coords_next_geo = niri_curr_geo_to_next_geo * coords_curr_geo;

              vec3 coords_stretch = niri_geo_to_tex_next * coords_curr_geo;
              vec3 coords_crop = niri_geo_to_tex_next * coords_next_geo;

              // We can crop if the current window size is smaller than the next window
              // size. One way to tell is by comparing to 1.0 the X and Y scaling
              // coefficients in the current-to-next transformation matrix.
              bool can_crop_by_x = niri_curr_geo_to_next_geo[0][0] <= 1.0;
              bool can_crop_by_y = niri_curr_geo_to_next_geo[1][1] <= 1.0;

              vec3 coords = coords_stretch;
              if (can_crop_by_x)
                  coords.x = coords_crop.x;
              if (can_crop_by_y)
                  coords.y = coords_crop.y;

              vec4 color = texture2D(niri_tex_next, coords.st);

              // However, when we crop, we also want to crop out anything outside the
              // current geometry. This is because the area of the shader is unspecified
              // and usually bigger than the current geometry, so if we don't fill pixels
              // outside with transparency, the texture will leak out.
              //
              // When stretching, this is not an issue because the area outside will
              // correspond to client-side decoration shadows, which are already supposed
              // to be outside.
              if (can_crop_by_x && (coords_curr_geo.x < 0.0 || 1.0 < coords_curr_geo.x))
                  color = vec4(0.0);
              if (can_crop_by_y && (coords_curr_geo.y < 0.0 || 1.0 < coords_curr_geo.y))
                  color = vec4(0.0);

              return color;
          }
        '';

        binds = with config.lib.niri.actions; {
          "Alt+1".action = focus-workspace 1;
          "Alt+2".action = focus-workspace 2;
          "Alt+3".action = focus-workspace 3;
          "Alt+4".action = focus-workspace 4;
          "Alt+5".action = focus-workspace 5;
          "Alt+6".action = focus-workspace 6;
          "Alt+7".action = focus-workspace 7;
          "Alt+8".action = focus-workspace 8;
          "Alt+9".action = focus-workspace 9;

          "Mod+Return".action = spawn "${config.profile.terminal}";
          "Mod+B".action = spawn "firefox";
          "Mod+E".action = spawn "nautilus";
          "Mod+D".action = spawn "neovide";
          "Mod+R".action = spawn "ags -q; ags";
          "Mod+Space".action = spawn "anyrun";
          "Mod+Escape".action = spawn "wlogout";

          "Mod+Q".action = close-window;
          "Mod+S".action = screenshot;
          "Alt+Equal".action = set-column-width "+10%";
          "Alt+Minus".action = set-column-width "-10%";
          "Alt+H".action = focus-column-left;
          "Alt+L".action = focus-column-right;
          "Alt+K".action = focus-window-up;
          "Alt+J".action = focus-window-down;
          "Alt+Shift+H".action = move-column-left;
          "Alt+Shift+L".action = move-column-right;
          "Alt+Shift+K".action = move-window-up;
          "Alt+Shift+J".action = move-window-down;

          "Mod+Shift+H".action = focus-monitor-left;
          "Mod+Shift+J".action = focus-monitor-down;
          "Mod+Shift+K".action = focus-monitor-up;
          "Mod+Shift+L".action = focus-monitor-right;

          "Mod+Shift+Ctrl+H".action = move-column-to-monitor-left;
          "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
          "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
          "Mod+Shift+Ctrl+L".action = move-column-to-monitor-right;

          "Mod+Shift+Slash".action = show-hotkey-overlay;
          "Mod+M".action = maximize-column;

          # // There are also commands that consume or expel a single window to the side.
          "Mod+BracketLeft".action = consume-or-expel-window-left;
          "Mod+BracketRight".action = consume-or-expel-window-right;

          "Mod+Equal".action = switch-preset-column-width;

          "Mod+Tab".action = focus-workspace-previous;

          "Mod+L".action = power-off-monitors;
          "Mod+Shift+R".action = reset-window-height;
          "Mod+C".action = center-column;
        };
      };
    };
  };
}
