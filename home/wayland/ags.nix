# in home.nix
{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    config.wayland.windowManager.hyprland.package
    bash
    coreutils
    gawk
    imagemagick
    procps
    ripgrep
    sassc
    wlogout
    glib
    brightnessctl
    inotify-tools
  ];

  programs.ags = {
    enable = true;

    # packages to add to gjs's runtime
    extraPackages = [ pkgs.libsoup_3 ];
  };
}
