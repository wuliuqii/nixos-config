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
    wl-clipboard
    wl-screenrec
    cliphist
    wlr-randr
    slurp
  ];

  programs.ags = {
    enable = true;
  };
}
