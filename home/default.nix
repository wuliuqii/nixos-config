{ config, pkgs, ... }:
let
  user = config.machine.userName;
in
{
  imports = [
    ./command-line
    ./editor
    ./firefox
    ./language
    ./mpv
    ./obs-studio
    ./scripts
    ./shell
    ./terminal
    ./fcitx5
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      libsForQt5.kdenlive
    ];

    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      TERMINAL = "foot";
      GTK_IM_MODULE = "fcitx5";
      QT_IM_MODULE = "fcitx5";
      XMODIFIERS = "@im=fcitx5";
      XDG_CONFIG_HOME = "\${HOME}/.config";
      XDG_CACHE_HOME = "\${HOME}/.cache";
      XDG_BIN_HOME = "\${HOME}/.local/bin";
      XDG_DATA_HOME = "\${HOME}/.local/share";
    };
    sessionPath = [
      "$HOME/go/bin"
    ];
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.nordzy-cursor-theme;
    name = "Nordzy-Cursor";
    size = 32;
  };
  gtk = {
    enable = true;
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };
    iconTheme = {
      name = "Nordzy-Icon";
      package = pkgs.nordzy-icon-theme;
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      # size = 16;
    };
  };

  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "23.05";
}
