{ config, ... }:
let
  e = "exec, ags -b hypr";

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
    monitor = [
      "DP-3, preferred, auto, 2"
      "eDP-1, preferred, 0x0, auto"
    ];

    # mouse movements
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
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
        "$mainMod SHIFT, R, togglesplit,"
        "$mainMod, T, togglefloating,"
        "$mainMod, P, pseudo,"
        "$mainMod ALT, ,resizeactive,"

        # toggle "monocle" (no_gaps_when_only)
        "$mainMod SHIFT, M, exec, hyprctl keyword ${monocle} $(($(hyprctl getoption ${monocle} -j | jaq -r '.int') ^ 1))"

        # terminal
        "$mainMod, Return, exec, ${config.machine.terminal}"
        ''${if config.machine.terminal == "wezterm" then 
          "$mainMod SHIFT, Return, exec, wezterm start --class termfloat"
        else if config.machine.terminal == "kitty" then
          "$mainMod SHIFT, Return, exec, kitty --class=termfloat"
        else ""}''

        # launcher
        "$mainMod, Space, ${e} -t launcher"
        # browser
        "$mainMod, B, exec, firefox"
        # vscode
        "$mainMod, C, exec, code"
        # music
        "$mainMod, M, exec, g4music"
        # file manager
        "$mainMod, E, exec, dolphin"
        # logout menu
        "$mainMod, Escape, ${e} -t powermenu"
        # overview
        "$mainMod, Tab, ${e} -t overview"
        # restart ags
        "$mainMod, R, ${e} quit; ags -b hypr"
        # lock screen
        "$mainMod, L, exec, loginctl lock-session"
        # clear cliphist database
        "$mainMod SHIFT, V, exec, cliphist wipe"
        # screenshot
        "$altMod, R, ${e} -r 'recorder.start()'"
        "$altMod CTRL, Z, ${e} -r 'recorder.screenshot()'"
        "$altMod, Z, ${e} -r 'recorder.screenshot(true)'"


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
        "$altMod, period, workspace, m+1"
        "$altMod, comma, workspace, m-1"

        # cycle monitors
        "$altMod SHIFT, comma, focusmonitor, eDP-1"
        "$altMod SHIFT, period, focusmonitor, DP-3"
      ]
      ++ workspaces;

    bindl = [
      # media controls
      ", XF86AudioPlay, ${e} -r 'mpris?.playPause()"
      ", XF86AudioStop, ${e} -r 'mpris?.stop()"
      ", XF86AudioPause, ${e} -r 'mpris?.pause()"
      ", XF86AudioNext, ${e} -r 'mpris?.next()"
      ", XF86AudioPrev, ${e} -r 'mpris?.previous()"
      ", XF86AudioMicMute, ${e} -r 'audio.microphone.isMuted = !aduio.microphone.isMuted'"
    ];

    bindle = [
      # volume
      ", XF86AudioRaiseVolume, ${e} -r 'audio.speaker.volume += 0.05; indicator.speaker()'"
      ", XF86AudioLowerVolume, ${e} -r 'audio.speaker.volume -= 0.05; indicator.speaker()'"

      # backlight
      ", XF86MonBrightnessUp, ${e} -r 'brightness.screen += 0.05; indicator.display()'"
      ", XF86MonBrightnessDown, ${e} -r 'brightness.screen -= 0.05; indicator.display()'"
    ];
  };
}


