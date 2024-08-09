{ config, ... }:
let
  fcitx5Home = "${config.xdg.configHome}/fcitx5";
in
{
  home.file = {
    "${fcitx5Home}/profile".source = ./profile;
    "${fcitx5Home}/config".source = ./config;
    "${fcitx5Home}/conf/classicui.conf".source = ./classicui.conf;
    "${fcitx5Home}/conf/rime.conf".source = ./rime.conf;
    ".local/share/fcitx5/rime/default.custom.yaml".source = ./default.custom.yaml;
  };

  # i18n.inputMethod.fcitx5.catppuccin = {
  #   enable = true;
  #   apply = true;
  # };
}
