# in home.nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    imagemagick
    sassc
    glib
    brightnessctl
    inotify-tools
    libnotify
    wf-recorder
    swappy
    wayshot
    hyprpicker
    swww
    wl-clipboard
    cliphist
    wlr-randr
    slurp
  ];

  programs.ags = {
    enable = true;

    # packages to add to gjs's runtime
    extraPackages = [ pkgs.libsoup_3 ];
  };
}
