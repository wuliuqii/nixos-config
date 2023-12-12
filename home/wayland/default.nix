{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    wlr-randr
    swaylock-effects
    swayidle
    pamixer
    grimblast
    xdg-desktop-portal-hyprland
    gnome.nautilus
    udiskie
    libsForQt5.dolphin
    glib
    libsForQt5.qtstyleplugin-kvantum
  ];

  imports = [
    ./rofi
    ./waybar

    ./hyprland.nix
    ./mako.nix
    ./swww.nix
    ./gtk.nix
    ./qt.nix
  ];
}
