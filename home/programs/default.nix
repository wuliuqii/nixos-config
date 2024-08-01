{ pkgs, ... }:
{
  imports = [
    ./fcitx5
    ./firefox

    ./media.nix
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
    (wechat-uos.override {
      uosLicense = pkgs.fetchurl {
        url = "https://aur.archlinux.org/cgit/aur.git/plain/license.tar.gz?h=wechat-uos-bwrap";
        hash = "sha256-U3YAecGltY8vo9Xv/h7TUjlZCyiIQdgSIp705VstvWk=";
      };
    })
    thunderbird
    rnote
    (pkgs.prismlauncher.override { withWaylandGLFW = true; })

    nautilus
    sushi
    loupe

    libsForQt5.kdenlive
  ];
}
