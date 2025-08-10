{ lib, config, ... }:
let
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
        "DP-1, preferred, auto, 2"
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

          # music player
          "$mainMod, m, exec, ikun-music-desktop"

          # launcher
          "$mainMod, Space, exec, anyrun"
          # browser
          "$mainMod, B, exec, ${config.profile.browser}"
          # file manager
          "$mainMod, E, exec, nautilus"
          # logout menu
          "$mainMod, Escape, exec, wlogout"
          # lock screen
          "$mainMod, L, exec, hyprlock"
          # screenshot
          "$mainMod, Z, exec, grimblast --notify copysave area"

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
        ++ [
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
      ];

      bindle = [
        # volume

        # backlight
      ];
    };

    extraConfig = ''
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
    '';
  };
}
