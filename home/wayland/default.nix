{ pkgs, ... }:
{
  imports = [
    ./hyprland
    ./ags

    ./swaylock.nix
  ];

  home.packages = with pkgs; [
    udiskie
    networkmanagerapplet
    qt6.qtwayland
    libsForQt5.qt5.qtwayland
  ];

  # make stuff work on wayland
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  };

  # fake a tray to let apps start
  # https://github.com/nix-community/home-manager/issues/2064
  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };
}
