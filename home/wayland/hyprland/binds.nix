{ ... }:
let
  screenshotsave = ''~/Pictures/screenshots/$(date "+%Y-%m-%d"T"%H:%M:%S").png'';
  screenshotarea = "hyprctl keyword animation 'fadeOut,0,0,default'; grimblast --notify copysave area; hyprctl keyword animation 'fadeOut,1,4,default'";

  workspaces = builtins.concatLists (builtins.genList
    (
      x:
      let
        ws =
          let
            c = (x + 1) / 10;
          in
          builtins.toString (x + 1 - (c * 10));
      in
      [
        "$altMod, ${ws}, workspace, ${toString (x + 1)}"
        "$altMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
      ]
    )
    10);
in
{
  wayland.windowManager.hyprland.settings = {
    # mouse movements
    bindm = [
      "$altMod, mouse:272, movewindow"
      "$mainMod, mouse:272, resizewindow"
    ];

    # binds
    bind =
      let
        monocle = "dwindle:no_gaps_when_only";
      in
      [
        # compositor commands
        "$mainMod SHIFT, E, exec, pkill Hyprland"
        "$mainMod, Q, killactive,"
        "$mainMod, F, fullscreen,"
        "$mainMod, G, togglegroup,"
        "$mainMod SHIFT, N, changegroupactive, f"
        "$mainMod SHIFT, P, changegroupactive, b"
        "$mainMod, R, togglesplit,"
        "$mainMod, T, togglefloating,"
        "$mainMod, P, pseudo,"
        "$mainMod ALT, ,resizeactive,"

        # toggle "monocle" (no_gaps_when_only)
        "$mainMod SHIFT, M, exec, hyprctl keyword ${monocle} $(($(hyprctl getoption ${monocle} -j | jaq -r '.int') ^ 1))"

        # utility
        # terminal
        "$mainMod, Return, exec, kitty"
        "$mainMod SHIFT, Return, exec, kitty --class=termfloat"
        # launcher
        "$mainMod, Space, exec, anyrun"
        # browser
        "$mainMod, B, exec, firefox"
        # vscode
        "$mainMod, C, exec, code --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime"
        # music
        "$mainMod, M, exec, yesplaymusic --force-device-scale-factor=2"
        # file manager
        "$mainMod, E, exec, dolphin"
        # logout menu
        "$mainMod, Escape, exec, wlogout -p layer-shell"
        # lock screen
        "$mainMod, L, exec, loginctl lock-session"
        # select area to perform OCR on
        "$mainMod, O, exec, run-as-service wl-ocr"
        # cliphist
        "$mainMod, V, exec, cliphist list | rofi -dmenu -theme ~/.config/rofi/launcher_theme | cliphist decode | wl-copy"
        "$mainMod SHIFT, V, exec, rm ~/.cache/cliphist/db"
        # screenshot
        # stop animations while screenshotting; makes black border go away
        "$altMod, Z, exec, ${screenshotarea}"
        "$altMod CTRL, Z, exec, grimblast --notify --cursor copysave area ${screenshotsave}"
        "$mainMod, Z, exec, grimblast --notify --cursor copysave screen ${screenshotsave}"
        "$mainMod SHIFT, Z, exec, grimblast --notify --cursor copysave output ${screenshotsave}"

        # move focus
        "$altMod, left, movefocus, l"
        "$altMod, right, movefocus, r"
        "$altMod, up, movefocus, u"
        "$altMod, down, movefocus, d"
        "$altMod, h, movefocus, l"
        "$altMod, l, movefocus, r"
        "$altMod, k, movefocus, u"
        "$altMod, j, movefocus, d"

        # move window in current workspace
        "$altMod SHIFT,left ,movewindow, l"
        "$altMod SHIFT,right ,movewindow, r"
        "$altMod SHIFT,up ,movewindow, u"
        "$altMod SHIFT,down ,movewindow, d"
        "$altMod SHIFT,h,movewindow, l"
        "$altMod SHIFT,l,movewindow, r"
        "$altMod SHIFT,k,movewindow, u"
        "$altMod SHIFT,j,movewindow, d"

        # special workspace
        "$altMod, minus, movetoworkspace, special"
        "$altMod, equal, togglespecialworkspace"

        # cycle workspaces
        "$altMod, period, workspace, m-1"
        "$altMod, comma, workspace, m+1"

        # cycle monitors
        "$altMod SHIFT, period, focusmonitor, l"
        "$altMod SHIFT, comma, focusmonitor, r"


      ]
      ++ workspaces;

    bindl = [
      # media controls
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioNext, exec, playerctl next"

      # volume
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ];

    bindle = [
      # volume
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%-"

      # backlight
      ", XF86MonBrightnessUp, exec, brillo -q -u 300000 -A 5"
      ", XF86MonBrightnessDown, exec, brillo -q -u 300000 -U 5"
    ];
  };
}

