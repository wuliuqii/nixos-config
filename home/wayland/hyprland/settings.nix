{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    "$altMod" = "ALT";

    exec-once = [
      "fcitx5"
      "ags -b hypr"
      "udiskie"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
    ];

    general = {
      layout = "dwindle";
      resize_on_border = true;
      border_size = 2;
      gaps_out = 6;
      gaps_in = 3;
      "col.active_border" = "0xfff5bde6";
      "col.inactive_border" = "0xff24273a";
    };

    decoration = {
      rounding = 10;
      drop_shadow = false;

      blur = {
        enabled = true;
        passes = 3;
        size = 6;
        new_optimizations = "on";
        ignore_opacity = "on";
        xray = false;
      };
    };

    animations = {
      enabled = true;
      bezier = [
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "liner, 1, 1, 1, 1"
      ];

      animation = [
        "border, 1, 1, liner"
        "borderangle, 1, 30, liner, loop"
        "fade, 1, 10, default"
        "windows, 1, 6, wind, slide"
        "windowsIn, 1, 6, winIn, slide"
        "windowsOut, 1, 5, winOut, slide"
        "windowsMove, 1, 5, wind, slide"
        "workspaces, 1, 5, wind"
      ];
    };

    input = {
      kb_layout = "us";

      follow_mouse = 1;
      accel_profile = "flat";
      sensitivity = 0;

      touchpad = {
        natural_scroll = "yes";
      };
    };

    dwindle = {
      # keep floating dimentions while tiling
      pseudotile = true;
      preserve_split = true;
    };

    misc = {
      vrr = 1;
      no_direct_scanout = false;
    };

    # touchpad gestures
    gestures = {
      workspace_swipe = true;
      workspace_swipe_forever = true;
      workspace_swipe_fingers = 3;
    };

    xwayland.force_zero_scaling = true;

    debug.disable_logs = false;
  };
}
