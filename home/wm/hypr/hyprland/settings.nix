{ lib, config, ... }:
let
  pointer = config.home.pointerCursor;
  cursorName = "Bibata-Modern-Classic-Hyprcursor";
in

lib.mkIf config.optional.hypr.enable {
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    "$altMod" = "ALT";

    env = [
      "HYPRCURSOR_THENE, ${cursorName}"
      "HYPRCURSOR_SIZE, ${toString pointer.size}"
    ];

    exec-once = [
      "fcitx5"
      "hyprctl setcursor ${cursorName} ${toString pointer.size}"
      # "wl-paste --type text --watch cliphist store"
      # "wl-paste --type image --watch cliphist store"
    ];

    general = {
      layout = "master";
      resize_on_border = true;
      border_size = 2;
      gaps_out = 6;
      gaps_in = 3;
      "col.active_border" = "0xee$lavenderAlpha 0xee$accentAlpha 45deg";
      "col.inactive_border" = "0xaa$overlay0Alpha 0xaa$mantleAlpha 45deg";
    };

    decoration = {
      rounding = 16;

      blur = {
        enabled = true;
        brightness = 1.0;
        contrast = 1.0;
        noise = 1.0e-2;
        vibrancy = 0.2;
        vibrancy_darkness = 0.5;
        passes = 4;
        size = 7;
        popups = true;
        popups_ignorealpha = 0.2;
      };

      shadow = {
        enabled = true;
        color = "rgba(00000055)";
        ignore_window = true;
        offset = "0 15";
        range = 100;
        render_power = 2;
        scale = 0.97;
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

    group = {
      groupbar = {
        # font_size = 16;
        # gradients = true;
        render_titles = false;
        height = 1;
        "col.active" = "$mauve";
        "col.inactive" = "$surface0";
      };

      "col.border_active" = "$flamingo";
      "col.border_inactive" = "$surface0";
    };

    input = {
      kb_layout = "us";

      follow_mouse = 1;
      mouse_refocus = false;
      accel_profile = "flat";
      sensitivity = 0;

      touchpad = {
        natural_scroll = "yes";
      };
    };

    dwindle = {
      # keep floating dimensions while tiling
      pseudotile = true;
      preserve_split = true;
    };

    master = {
      new_status = "master";
      new_on_top = true;
    };

    misc = {
      vrr = 1;
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
    };

    render.direct_scanout = true;

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
