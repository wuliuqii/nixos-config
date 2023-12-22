{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    "$altMod" = "ALT";

    monitor = [
      "DP-3, preferred, -3840x0, 2"
      "eDP-1, preferred, auto, auto"
    ];

    exec-once = [
      "systemctl --user start clight"
      "fcitx5"
      "waybar"
      "mako"
      "blueman-applet"
      "nm-applet --indicator"
      "udiskie"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
    ];

    general = {
      gaps_in = 3;
      gaps_out = 8;
      border_size = 2;
      "col.active_border" = "0xfff5bde6";
      "col.inactive_border" = "0xff24273a";
      layout = "dwindle";
      resize_on_border = true;
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
    };

    # touchpad gestures
    gestures = {
      workspace_swipe = true;
      workspace_swipe_forever = true;
      workspace_swipe_fingers = 3;
    };

    xwayland.force_zero_scaling = true;

    debug.disable_logs = false;

    blurls = "waybar";
  };
}
