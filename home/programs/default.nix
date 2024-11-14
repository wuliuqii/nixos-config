{ pkgs, ... }:
let
  wechat = pkgs.makeDesktopItem {
    name = "wehcat";
    desktopName = "wechat";
    exec = "QT_SCALE_FACTOR=2 wechat-uos %U";
    terminal = false;
    icon = "wechat";
    comment = "WeChat for Linux";
  };
in
{
  imports = [
    ./fcitx5
    ./firefox

    ./media.nix
    ./zathura.nix
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
    # cinny-desktop
    slack
    qq
    wechat-uos
    # (wechat-uos.override {
    #   uosLicense = pkgs.fetchurl {
    #     url = "https://aur.archlinux.org/cgit/aur.git/plain/license.tar.gz?h=wechat-uos-bwrap";
    #     hash = "sha256-U3YAecGltY8vo9Xv/h7TUjlZCyiIQdgSIp705VstvWk=";
    #   };
    # })
    (wechat)
    thunderbird

    nautilus
    sushi
    loupe

    libsForQt5.kdenlive
  ];
}
