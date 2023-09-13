{ pkgs, ... }:

let
  myswaylock = pkgs.writeShellScriptBin "myswaylock" ''
    swaylock  \
           --image "${../../wallpaper/nord_mountains.png}" \
           --clock \
           --indicator \
           --indicator-radius 100 \
           --indicator-thickness 7 \
           --effect-vignette 0.5:0.5 \
           --ring-color 3b4252 \
           --key-hl-color 880033 \
           --line-color 00000000 \
           --inside-color 00000088 \
           --separator-color 00000000 \
           --grace 2 \
           --fade-in 0.3
  '';
  default_wall = pkgs.writeShellScriptBin "default_wall" ''
    swww img "${../../wallpaper/nord_mountains.png}" --transition-type random
  '';
  border_color = pkgs.writeShellScriptBin "border_color" ''
    function border_color {
      hyprctl keyword general:col.active_border rgb\(81a1c1\)
    }

    socat - UNIX-CONNECT:/tmp/hypr/$(echo $HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock | while read line; do border_color $line; done
  '';
in
{
  home.packages = [
    myswaylock
    default_wall
    border_color
  ];
}
