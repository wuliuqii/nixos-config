{ ... }:

{
  programs = {
    bash = {
      initExtra = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
           exec  Hyprland
        fi
      '';
    };
    fish = {
      loginShellInit = ''
        set TTY1 (tty)
        [ "$TTY1" = "/dev/tty1" ] && exec Hyprland
      '';
    };
  };
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    recommendedEnvironment = true;
    extraConfig = ''
      ######################################################################################
      #AUTOGENERATED HYPR CONFIG.
      #PLEASE USE THE CONFIG PROVIDED IN THE GIT REPO /examples/hypr.conf AND EDIT IT,
      #OR EDIT THIS ONE ACCORDING TO THE WIKI INSTRUCTIONS.
      ########################################################################################

      # Please note not all available settings / options are set here.
      # For a full list, see the wiki
      # autogenerated = 1 # remove this line to remove the warning


      # █▀▄▀█ █▀█ █▄░█ █ ▀█▀ █▀█ █▀█
      # █░▀░█ █▄█ █░▀█ █ ░█░ █▄█ █▀▄

      # See https://wiki.hyprland.org/Configuring/Monitors/

      # monitor = ,preferred,auto,2
      monitor=DP-1, 3840x2160, 0x0, 2
      monitor=eDP-1, 2880x1800@90, 3820x0, 2



      # █░░ ▄▀█ █░█ █▄░█ █▀▀ █░█
      # █▄▄ █▀█ █▄█ █░▀█ █▄▄ █▀█

      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      # Execute your favorite apps at launch

      exec-once = swww init
      exec-once = fcitx5
      exec-once = waybar
      exec-once = mako
      exec-once = blueman-applet
      exec-once = nm-applet --indicator
      exec-once = swayidle timeout 300 'myswaylock' timeout 600 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'myswaylock'
      exec-once = udiskie
      exec-once = wl-paste --type text --watch cliphist store # clipboard store text data
      exec-once = wl-paste --type image --watch cliphist store # clipboard store image data


      # █▀▀ █▄░█ █░█
      # ██▄ █░▀█ ▀▄▀

      # Some default env vars.

      env = XDG_CURRENT_DESKTOP,Hyprland
      env = XDG_SESSION_TYPE,wayland
      env = XDG_SESSION_DESKTOP,Hyprland
      env = GDK_BACKEND,wayland
      env = QT_QPA_PLATFORM,wayland
      env = QT_QPA_PLATFORMTHEME,qt5ct
      env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
      env = QT_AUTO_SCREEN_SCALE_FACTOR,1
      env = XDG_PICTURES_DIR,$HOME/Pictures



      # █ █▄░█ █▀█ █░█ ▀█▀
      # █ █░▀█ █▀▀ █▄█ ░█░

      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/

      input {
          kb_layout = us
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =
          follow_mouse = 1

          touchpad {
              natural_scroll = yes
          }

          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
          force_no_accel = 1
      }

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more

      device:epic mouse V1 {
          sensitivity = -0.5
      }

      # See https://wiki.hyprland.org/Configuring/Variables/ for more

      gestures {
          workspace_swipe = true
          workspace_swipe_fingers = 3
      }



      # █░░ ▄▀█ █▄█ █▀█ █░█ ▀█▀ █▀
      # █▄▄ █▀█ ░█░ █▄█ █▄█ ░█░ ▄█

      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more

      dwindle {
          pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = yes # you probably want this
      }

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more

      master {
          new_is_master = true
      }



      # █▀▄▀█ █ █▀ █▀▀
      # █░▀░█ █ ▄█ █▄▄

      # See https://wiki.hyprland.org/Configuring/Variables/ for more

      misc {
          vrr = 0
      }


      # ▄▀█ █▄░█ █ █▀▄▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█
      # █▀█ █░▀█ █ █░▀░█ █▀█ ░█░ █ █▄█ █░▀█


      # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

      animations {
          enabled = yes
          bezier = wind, 0.05, 0.9, 0.1, 1.05
          bezier = winIn, 0.1, 1.1, 0.1, 1.1
          bezier = winOut, 0.3, -0.3, 0, 1
          bezier = liner, 1, 1, 1, 1
          animation = windows, 1, 6, wind, slide
          animation = windowsIn, 1, 6, winIn, slide
          animation = windowsOut, 1, 5, winOut, slide
          animation = windowsMove, 1, 5, wind, slide
          animation = border, 1, 1, liner
          animation = borderangle, 1, 30, liner, loop
          animation = fade, 1, 10, default
          animation = workspaces, 1, 5, wind
      }

      general {
          gaps_in = 3
          gaps_out = 8
          border_size = 2
          col.active_border = rgba(6f616aff) rgba(b48eadff) 45deg
          col.inactive_border = rgba(b4befecc) rgba(6c7086cc) 45deg
          layout = dwindle
          resize_on_border = true
      }

      decoration {
          rounding = 10
          drop_shadow = false

          blur {
              enabled = yes
              size = 6
              passes = 3
              new_optimizations = on
              ignore_opacity = on
              xray = false
          }
      }

      blurls = waybar



      # █▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄ █ █▄░█ █▀▀ █▀
      # █░█ ██▄ ░█░ █▄█ █ █░▀█ █▄▀ █ █░▀█ █▄█ ▄█


      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more

      # Main modifier
      $mainMod = SUPER # windows key
      $altMod = ALT


      bind = $mainMod, Return, exec, kitty
      bind = $mainMod, Q, killactive,
      bind = $mainMod SHIFT, Space, togglefloating,
      bind = $mainMod, F, fullscreen
      bind = $mainMod, Y, pin
      bind = $mainMod, B, exec, firefox
      bind = $mainMod, Z, exec, grimblast --notify --cursor copy area
      bind = $altMod CTRL, Z, exec, grimblast --notify --cursor copysave area ~/Pictures/screenshots/$(date "+%Y-%m-%d"T"%H:%M:%S").png
      bind = $mainMod, M, exec, yesplaymusic
      bind = $mainMod, E, exec, nautilus
      bind = $mainMod, C, exec, code --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime

      #------------------------#
      # quickly launch program #
      #------------------------#
      bind = $mainMod, L, exec, myswaylock
      bind = $mainMod, Space, exec, pkill rofi || ~/.config/rofi/launcher.sh
      bind = $mainMod, p, exec, bash ~/.config/rofi/powermenu.sh
      bind = $mainMod, V, exec, cliphist list | rofi -dmenu -theme ~/.config/rofi/launcher_theme | cliphist decode | wl-copy
      bind = $mainMod SHIFT, v, exec, rm ~/.cache/cliphist/db


      #--------------------------------------#
      # Move focus with mainMod + arrow keys #
      #--------------------------------------#
      bind = $altMod, left, movefocus, l
      bind = $altMod, right, movefocus, r
      bind = $altMod, up, movefocus, u
      bind = $altMod, down, movefocus, d
      bind = $altMod, h, movefocus, l
      bind = $altMod, l, movefocus, r
      bind = $altMod, k, movefocus, u
      bind = $altMod, j, movefocus, d

      #----------------------------------------#
      # Switch workspaces with mainMod + [0-9] # #----------------------------------------#
      bind = $altMod, 1, workspace, 1
      bind = $altMod, 2, workspace, 2
      bind = $altMod, 3, workspace, 3
      bind = $altMod, 4, workspace, 4
      bind = $altMod, 5, workspace, 5
      bind = $altMod, 6, workspace, 6
      bind = $altMod, 7, workspace, 7
      bind = $altMod, 8, workspace, 8
      bind = $altMod, 9, workspace, 9
      bind = $altMod, 0, workspace, 10
      bind = $altMod, period, workspace, e+1
      bind = $altMod, comma, workspace,e-1

      #-------------------------------#
      # special workspace(scratchpad) #
      #-------------------------------#
      bind = $altMod, minus, movetoworkspace,special
      bind = $altMod, equal, togglespecialworkspace

      #----------------------------------#
      # move window in current workspace #
      #----------------------------------#
      bind = $altMod SHIFT,left ,movewindow, l
      bind = $altMod SHIFT,right ,movewindow, r
      bind = $altMod SHIFT,up ,movewindow, u
      bind = $altMod SHIFT,down ,movewindow, d
      bind = $altMod SHIFT,h,movewindow, l
      bind = $altMod SHIFT,l,movewindow, r
      bind = $altMod SHIFT,k,movewindow, u
      bind = $altMod SHIFT,j,movewindow, d

      #---------------------------------------------------------------#
      # Move active window to a workspace with mainMod + ctrl + [0-9] #
      #---------------------------------------------------------------#
      bind = $altMod CTRL, 1, movetoworkspace, 1
      bind = $altMod CTRL, 2, movetoworkspace, 2
      bind = $altMod CTRL, 3, movetoworkspace, 3
      bind = $altMod CTRL, 4, movetoworkspace, 4
      bind = $altMod CTRL, 5, movetoworkspace, 5
      bind = $altMod CTRL, 6, movetoworkspace, 6
      bind = $altMod CTRL, 7, movetoworkspace, 7
      bind = $altMod CTRL, 8, movetoworkspace, 8
      bind = $altMod CTRL, 9, movetoworkspace, 9
      bind = $altMod CTRL, 0, movetoworkspace, 10
      bind = $altMod CTRL, left, movetoworkspace, -1
      bind = $altMod CTRL, right, movetoworkspace, +1
      # same as above, but doesnt switch to the workspace
      bind = $altMod SHIFT, 1, movetoworkspacesilent, 1
      bind = $altMod SHIFT, 2, movetoworkspacesilent, 2
      bind = $altMod SHIFT, 3, movetoworkspacesilent, 3
      bind = $altMod SHIFT, 4, movetoworkspacesilent, 4
      bind = $altMod SHIFT, 5, movetoworkspacesilent, 5
      bind = $altMod SHIFT, 6, movetoworkspacesilent, 6
      bind = $altMod SHIFT, 7, movetoworkspacesilent, 7
      bind = $altMod SHIFT, 8, movetoworkspacesilent, 8
      bind = $altMod SHIFT, 9, movetoworkspacesilent, 9
      bind = $altMod SHIFT, 0, movetoworkspacesilent, 10

      #-------------------------------------------#
      # switch between current and last workspace #
      #-------------------------------------------#
      binds {
            workspace_back_and_forth = 1
            allow_workspace_cycles = 1
      }
      bind=$altMod,slash,workspace,previous


      #-----------------------------------------#
      # control volume,brightness,media players-#
      #-----------------------------------------#
      bind=,XF86AudioRaiseVolume,exec, pamixer -i 5
      bind=,XF86AudioLowerVolume,exec, pamixer -d 5
      bind=,XF86AudioMute,exec, pamixer -t
      bind=,XF86AudioMicMute,exec, pamixer --default-source -t
      bind=,XF86MonBrightnessUp,exec, light -A 5
      bind=,XF86MonBrightnessDown, exec, light -U 5
      bind=,XF86AudioPlay,exec, mpc -q toggle
      bind=,XF86AudioNext,exec, mpc -q next
      bind=,XF86AudioPrev,exec, mpc -q prev

      #---------------#
      # waybar toggle #
      # --------------#
      bind=$mainMod,O,exec,killall -SIGUSR1 .waybar-wrapped

      #---------------#
      # resize window #
      #---------------#
      bind=$altMod,R,submap,resize
      submap=resize
      binde=,right,resizeactive,15 0
      binde=,left,resizeactive,-15 0
      binde=,up,resizeactive,0 -15
      binde=,down,resizeactive,0 15
      binde=,l,resizeactive,15 0
      binde=,h,resizeactive,-15 0
      binde=,k,resizeactive,0 -15
      binde=,j,resizeactive,0 15
      bind=,escape,submap,reset
      submap=reset

      bind=CTRL SHIFT, left, resizeactive, 15 0
      bind=CTRL SHIFT, right, resizeactive,-15 0
      bind=CTRL SHIFT, up, resizeactive, 0 -15
      bind=CTRL SHIFT, down, resizeactive, 0 15



      # █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█   █▀█ █░█ █░░ █▀▀ █▀
      # ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀   █▀▄ █▄█ █▄▄ ██▄ ▄█


      windowrule=float,imv
      windowrule=move 25%-,imv
      windowrule=size 960 540,imv
      windowrule=float,mpv
      windowrule=move 25%-,mpv
      windowrule=size 960 540,mpv
      windowrule=float,termfloat
      windowrule=move 25%-,termfloat
      windowrule=size 960 540,termfloat
      windowrule=rounding 5,termfloat
      windowrule=animation slide left, kitty
      windowrule=float,ncmpcpp
      windowrule=move 25%-,ncmpcpp
      windowrule=size 960 540,ncmpcpp
      windowrule=noblur,^(firefox)$
      windowrule=workspace name:󰝚, yesplaymusic

      windowrulev2 = opacity 0.90 0.90,class:^(firefox)$
      windowrulev2 = opacity 0.80 0.80,class:^(Code)$
      windowrulev2 = opacity 0.80 0.80,class:^(code-url-handler)$
      windowrulev2 = opacity 0.80 0.80,class:^(kitty)$
      windowrulev2 = opacity 0.80 0.80,class:^(org.kde.dolphin)$
      windowrulev2 = opacity 0.80 0.80,class:^(qt5ct)$

      windowrulev2 = opacity 0.80 0.80,class:^(com.obsproject.Studio)$ #Obs-Qt

      windowrulev2 = opacity 0.80 0.70,class:^(pavucontrol)$
      windowrulev2 = opacity 0.80 0.70,class:^(blueman-manager)$
      windowrulev2 = opacity 0.80 0.70,class:^(nm-applet)$
      windowrulev2 = opacity 0.80 0.70,class:^(nm-connection-editor)$
      windowrulev2 = opacity 0.80 0.70,class:^(org.kde.polkit-kde-authentication-agent-1)$

      windowrulev2 = float,class:^(qt5ct)$
      windowrulev2 = float,class:^(nwg-look)$
      windowrulev2 = float,class:^(Signal)$ #Signal-Gtk
      windowrulev2 = float,class:^(pavucontrol)$
      windowrulev2 = float,class:^(blueman-manager)$
      windowrulev2 = float,class:^(nm-applet)$
      windowrulev2 = float,class:^(nm-connection-editor)$
      windowrulev2 = float,class:^(org.kde.polkit-kde-authentication-agent-1)$


      #-----------------#
      # workspace rules #
      #-----------------#
      workspace=eDP-1,1
      workspace=eDP-1,2
      workspace=eDP-1,3
      workspace=eDP-1,4
      workspace=eDP-1,5
      workspace=DP-1,6
      workspace=DP-1,7
      workspace=DP-1,8
      workspace=DP-1,9
      workspace=DP-1,10
    '';
  };
}
