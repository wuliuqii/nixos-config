{ pkgs, ... }:
{
  imports = [
    ./fcitx5
    ./firefox

    ./media.nix
    ./gtk.nix
    ./zathura.nix
    ./cli.nix
    ./mimelist.nix
  ];

  programs = {
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        input-overlay
        obs-pipewire-audio-capture
      ];
    };
  };

  home.packages = with pkgs; [
    xdg-utils

    # Social Apps
    telegram-desktop
    discord
    cinny-desktop
    slack
    qq
    thunderbird

    gnome.nautilus
    gnome.sushi
    loupe

    libsForQt5.kdenlive
  ];
}
