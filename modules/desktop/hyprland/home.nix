#
#  Hyprland Home-manager configuration
#
#  flake.nix
#   ├─ ./hosts
#   │   └─ ./<host>
#   │       └─ home.nix
#   └─ ./modules
#       └─ ./desktop
#           └─ ./hyprland
#               └─ home.nix *
#

{ config, lib, pkgs, host, ... }:

let
  confFile = with host; ''
    source=~/.config/hypr/macchiato.conf

    MONITORS

    general {
      sensitivity=1
      #main_mod=SUPER
      border_size=3
      gaps_in=5
      gaps_out=7
      col.active_border=$pink
      col.inactive_border=$surface0
      layout=dwindle
    }

    decoration {
      rounding=5
      multisample_edges=true
      active_opacity=0.93
      inactive_opacity=0.93
      fullscreen_opacity=1
      blur=true
      drop_shadow=false

      col.shadow=$surface0
      col.shadow_inactive=$surface0
    }

    animations {
      enabled=true
      bezier = myBezier,0.1,0.7,0.1,1.05
      animation=fade,1,7,default
      animation=windows,1,7,myBezier
      animation=windowsOut,1,3,default,popin 60%
      animation=windowsMove,1,7,myBezier
    }

    input {
      kb_layout=us
      kb_options=caps:ctrl_modifier
      follow_mouse=2
      repeat_delay=250
      numlock_by_default=1
      force_no_accel=1
      sensitivity=1
    }

    dwindle {
      pseudotile=false
      force_split=2
    }

    debug {
      damage_tracking=2
    }

    bindm=SUPER,mouse:272,movewindow
    bindm=SUPER,mouse:273,resizewindow

    bind=SUPER,Return,exec,alacritty
    bind=SUPER,Q,killactive,
    bind=SUPER,R,exec,powermenu,
    bind=SUPER,E,exec,pcmanfm
    bind=SUPER,B,exec,microsoft-edge-dev
    bind=SUPER,Space,exec,rofi -show drun
    bind=SUPER,P,pseudo,
    bind=SUPER,F,fullscreen,
    #bind=SUPER,R,exec,hyprctl reload

    windowrule=workspace 1 silent,alacritty
    windowrule=workspace 2 silent,microsoft-edge-dev

    bind=SUPER,h,movefocus,l
    bind=SUPER,l,movefocus,r
    bind=SUPER,k,movefocus,u
    bind=SUPER,j,movefocus,d

    bind=SUPERSHIFT,h,movewindow,l
    bind=SUPERSHIFT,l,movewindow,r
    bind=SUPERSHIFT,k,movewindow,u
    bind=SUPERSHIFT,j,movewindow,d

    bind=ALT,1,workspace,1
    bind=ALT,2,workspace,2
    bind=ALT,3,workspace,3
    bind=ALT,4,workspace,4
    bind=ALT,5,workspace,5
    bind=ALT,6,workspace,6
    bind=ALT,7,workspace,7
    bind=ALT,8,workspace,8
    bind=ALT,9,workspace,9
    bind=ALT,0,workspace,10
    bind=ALT,l,workspace,+1
    bind=ALT,h,workspace,-1

    bind=ALTSHIFT,1,movetoworkspace,1
    bind=ALTSHIFT,2,movetoworkspace,2
    bind=ALTSHIFT,3,movetoworkspace,3
    bind=ALTSHIFT,4,movetoworkspace,4
    bind=ALTSHIFT,5,movetoworkspace,5
    bind=ALTSHIFT,6,movetoworkspace,6
    bind=ALTSHIFT,7,movetoworkspace,7
    bind=ALTSHIFT,8,movetoworkspace,8
    bind=ALTSHIFT,9,movetoworkspace,9
    bind=ALTSHIFT,0,movetoworkspace,10

    bind=ALTSHIFT,l,resizeactive,20 0
    bind=ALTSHIFT,h,resizeactive,-20 0
    bind=ALTSHIFT,j,resizeactive,0 -20
    bind=ALTSHIFT,k,resizeactive,0 20

    bind=,print,exec,${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.swappy}/bin/swappy -f - -o ~/Pictures/$(date +%Hh_%Mm_%Ss_%d_%B_%Y).png && notify-send "Saved to ~/Pictures/$(date +%Hh_%Mm_%Ss_%d_%B_%Y).png"

    bind=,XF86AudioLowerVolume,exec,${pkgs.pamixer}/bin/pamixer -d 10
    bind=,XF86AudioRaiseVolume,exec,${pkgs.pamixer}/bin/pamixer -i 10
    bind=,XF86AudioMute,exec,${pkgs.pamixer}/bin/pamixer -t
    bind=,XF86AudioMicMute,exec,${pkgs.pamixer}/bin/pamixer --default-source -t
    bind=,XF86MonBrightnessDown,exec,${pkgs.light}/bin/light -U 5
    bind=,XF86MonBrightnessUP,exec,${pkgs.light}/bin/light -A 5

    windowrule=float,^(Rofi)$
    windowrule=float,title:^(Volume Control)$
    windowrule=float,title:^(Picture-in-Picture)$
    windowrule=pin,title:^(Picture-in-Picture)$
    windowrule=move 75% 75% ,title:^(Picture-in-Picture)$
    windowrule=size 24% 24% ,title:^(Picture-in-Picture)$

    exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
    #exec-once=swaybg -m center -i $HOME/.config/wall
    #exec-once=mpvpaper -sf -v -o "--loop --panscan=1" '*' $HOME/.config/wall.mp4
    exec-once=hyprpaper
    exec-once=waybar
    exec-once=fcitx5 
  '';

  hyprlandConf = with host; builtins.replaceStrings ["MONITORS"]
    [
      (if hostName == "desktop" then ''
        monitor=${toString mainMonitor},3840x2160@60,0x0,2
      ''
      else false)
    ]
    "${confFile}";
in
{
  xdg.configFile."hypr/hyprland.conf".text = hyprlandConf;
  xdg.configFile."hypr/hyprpaper.conf".text = builtins.readFile ./hyprpaper.conf;
  xdg.configFile."hypr/macchiato.conf".text = builtins.readFile ./macchiato.conf;
}
