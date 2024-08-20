{ lib, config, ... }:
let
  e = "exec, ags";

  workspaces = builtins.concatLists (
    builtins.genList (
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
    ) 10
  );
in

lib.mkIf config.optional.hypr.enable {
  wayland.windowManager.hyprland = {
    settings = {
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
          "$mainMod, Q, killactive"
          "$mainMod, T, togglefloating"
          "$mainMod, F, fullscreen"

          # toggle "monocle" (no_gaps_when_only)
          "$mainMod SHIFT, M, exec, hyprctl keyword ${monocle} $(($(hyprctl getoption ${monocle} -j | jaq -r '.int') ^ 1))"

          # terminal
          "$mainMod, Return, exec, ${config.profile.terminal}"
          "$mainMod, d, exec, neovide"

          # launcher
          "$mainMod, Space, exec, anyrun"
          # browser
          "$mainMod, B, exec, firefox"
          # file manager
          "$mainMod, E, exec, nautilus"
          # logout menu
          "$mainMod, Escape, exec, wlogout"
          # restart ags
          "$mainMod, R, ${e} quit; ags"
          # lock screen
          "$mainMod, L, exec, hyprlock"
          # screenshot
          "$mainMod, R, ${e} -r 'recorder.start()'"
          "$altMod CTRL, Z, ${e} -r 'recorder.screenshot()'"
          "$mainMod, Z, ${e} -r 'recorder.screenshot(true)'"

          # cycle workspaces
          "$altMod, period, workspace, m+1"
          "$altMod, comma, workspace, m-1"

          # send focused workspace to left/right monitors
          "$mainMod SHIFT, comma, movecurrentworkspacetomonitor, l"
          "$mainMod SHIFT, period, movecurrentworkspacetomonitor, r"

          # cycle monitors
          "$altMod SHIFT, comma, focusmonitor, l"
          "$altMod SHIFT, period, focusmonitor, r"
        ]
        ++ workspaces
        ++ lib.lists.optionals config.optional.hypr.scroller [
          "$mainMod, backetleft, scroller:setmode, c"
          "$mainMod, backetright, scroller:setmode, r"

          "$altMod, equal, scroller:cyclesize, next"
          "$altMod, minus, scroller:cyclesize, prev"
          "$altMod, semicolon, scroller:admitwindow"
          "$altMod, apostrophe, scroller:expelwindow"

          "$altMod, h, scroller:movefocus, l"
          "$altMod, l, scroller:movefocus, r"
          "$altMod, k, scroller:movefocus, u"
          "$altMod, j, scroller:movefocus, d"

          "$altMod SHIFT, h, scroller:movewindow, l"
          "$altMod SHIFT, l, scroller:movewindow, r"
          "$altMod SHIFT, k, scroller:movewindow, u"
          "$altMod SHIFT, j, scroller:movewindow, d"

        ]
        ++ lib.lists.optionals (!config.optional.hypr.scroller) [
          "$mainMod, G, togglegroup"
          "$mainMod, N, changegroupactive, f"
          "$mainMod, P, changegroupactive, b"
          "$mainMod SHIFT, R, togglesplit"

          "$altMod, h, movefocus, l"
          "$altMod, l, movefocus, r"
          "$altMod, k, movefocus, u"
          "$altMod, j, movefocus, d"
          "$altMod, s, layoutmsg, swapwithmaster master"

          "$altMod SHIFT, h, movewindow, l"
          "$altMod SHIFT, l, movewindow, r"
          "$altMod SHIFT, k, movewindow, u"
          "$altMod SHIFT, j, movewindow, d"

          # special workspace
          "$altMod, minus, movetoworkspace, special"
          "$altMod, equal, togglespecialworkspace"

        ];

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

    extraConfig =
      ''
        # Resize submap
        # will switch to a submap called resize
        bind = $altMod, r, submap, resize
        # will start a submap called "resize"
        submap = resize
        # sets repeatable binds for resizing the active window
        binde = , l, resizeactive, 10 0
        binde = , h, resizeactive, -10 0
        binde = , k, resizeactive, 0 -10
        binde = , j, resizeactive, 0 10
        # use reset to go back to the global submap
        bind = , escape, submap, reset
        # will reset the submap, meaning end the current one and return to the global one
        submap = reset
      ''
      + lib.strings.optionalString config.optional.hypr.scroller ''
        bind = $mainMod, c, submap, center
        submap = center
        bind = , C, scroller:alignwindow, c
        bind = , C, submap, reset
        bind = , l, scroller:alignwindow, r
        bind = , l, submap, reset
        bind = , h, scroller:alignwindow, l
        bind = , h, submap, reset
        bind = , k, scroller:alignwindow, u
        bind = , k, submap, reset
        bind = , j, scroller:alignwindow, d
        bind = , j, submap, reset
        bind = , escape, submap, reset
        submap = reset

        bind = $mainMod, w, submap, fitsize
        submap = fitsize
        bind = , v, scroller:fitsize, visible
        bind = , v, submap, reset
        bind = , e, scroller:fitsize, toend
        bind = , e, submap, reset
        bind = , b, scroller:fitsize, tobeg
        bind = , b, submap, reset
        bind = , f, scroller:fitsize, active
        bind = , f, submap, reset
        bind = , a, scroller:fitsize, all
        bind = , a, submap, reset
        bind = , escape, submap, reset
        submap = reset

        bind = $altMod, tab, scroller:toggleoverview
        bind = $altMod, tab, submap, overview
        submap = overview
        bind = , l, scroller:movefocus, right
        bind = , h, scroller:movefocus, left
        bind = , k, scroller:movefocus, up
        bind = , j, scroller:movefocus, down
        bind = , escape, scroller:toggleoverview,
        bind = , escape, submap, reset
        bind = , return, scroller:toggleoverview,
        bind = , return, submap, reset
        bind = $mainMod, tab, scroller:toggleoverview,
        bind = $mainMod, tab, submap, reset
        submap = reset

        # Marks
        bind = $altMod, M, submap, marksadd
        submap = marksadd
        bind = , a, scroller:marksadd, a
        bind = , a, submap, reset
        bind = , b, scroller:marksadd, b
        bind = , b, submap, reset
        bind = , c, scroller:marksadd, c
        bind = , c, submap, reset
        bind = , escape, submap, reset
        submap = reset

        bind = $altMod SHIFT, M, submap, marksdelete
        submap = marksdelete
        bind = , a, scroller:marksdelete, a
        bind = , a, submap, reset
        bind = , b, scroller:marksdelete, b
        bind = , b, submap, reset
        bind = , c, scroller:marksdelete, c
        bind = , c, submap, reset
        bind = , escape, submap, reset
        submap = reset

        bind = $mainMod, m, submap, marksvisit
        submap = marksvisit
        bind = , a, scroller:marksvisit, a
        bind = , a, submap, reset
        bind = , b, scroller:marksvisit, b
        bind = , b, submap, reset
        bind = , c, scroller:marksvisit, c
        bind = , c, submap, reset
        bind = , escape, submap, reset
        submap = reset

        bind = $mainMod CTRL, M, scroller:marksreset
      '';
  };
}
