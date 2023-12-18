# in home.nix
{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    config.wayland.windowManager.hyprland.package
    bash
    coreutils
    gawk
    gnome.gnome-control-center
    imagemagick
    overskride
    procps
    ripgrep
    dart-sass
    wlogout
    glib
  ];

  programs.ags = {
    enable = true;

    # packages to add to gjs's runtime
    extraPackages = [ pkgs.libsoup_3 ];
  };
}
