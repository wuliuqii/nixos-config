{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
{
  imports = [

    ./binds.nix
    ./rules.nix
    ./settings.nix
  ];
  config = lib.mkIf config.optional.hypr.enable {
    home.packages = with pkgs; [
      networkmanagerapplet
      qt6.qtwayland
      libsForQt5.qt5.qtwayland
    ];

    # fake a tray to let apps start
    # https://github.com/nix-community/home-manager/issues/2064
    systemd.user.targets.tray = {
      Unit = {
        Description = "Home Manager System Tray";
        Requires = [ "graphical-session-pre.target" ];
      };
    };

    home.sessionVariables = {
      # XDG_CURRENT_DESKTOP = "Hyprland";
      # XDG_SESSION_DESKTOP = "Hyprland";
      GDK_SCALE = "2";

      QT_QPA_PLATFORM = "wayland";
      SDL_VIDEODRIVER = "wayland";
      XDG_SESSION_TYPE = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    };

    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.default;
      catppuccin.enable = true;
      plugins =
        [ ]
        ++ lib.optional config.optional.hypr.enable
          inputs.hyprscroller.packages.${pkgs.system}.hyprscroller;
    };
  };
}
