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
      gaps_in = 5;
      gaps_out = 5;
      border_size = 1;
      "col.active_border" = "rgba(88888888)";
      "col.inactive_border" = "rgba(00000088)";
    };

    decoration = {
      rounding = 16;
      blur = {
        enabled = true;
        brightness = 1.0;
        contrast = 1.0;
        noise = 0.02;

        passes = 3;
        size = 10;
      };

      drop_shadow = true;
      shadow_ignore_window = true;
      shadow_offset = "0 2";
      shadow_range = 20;
      shadow_render_power = 3;
      "col.shadow" = "rgba(00000055)";
    };

    animations = {
      enabled = true;
      animation = [
        "border, 1, 2, default"
        "fade, 1, 4, default"
        "windows, 1, 3, default, popin 80%"
        "workspaces, 1, 2, default, slide"
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
