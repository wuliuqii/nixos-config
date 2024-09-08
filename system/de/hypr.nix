{
  lib,
  inputs,
  pkgs,
  config,
  ...
}:

lib.mkIf config.optional.hypr.enable {
  programs = {
    dconf.enable = true;
    light.enable = true;
    kdeconnect.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
    };
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      # xdg-desktop-portal-wlr
    ];
    config = {
      common.default = [ "gtk" ];
      hyprland.default = [
        "hyprland"
        "gtk"
      ];
    };
  };

  services = {
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    # needed for GNOME services outside of GNOME Desktop
    dbus.packages = [ pkgs.gcr ];

    greetd =
      let
        session = {
          command = "${lib.getExe config.programs.hyprland.package}";
          user = "${config.profile.userName}";
        };
      in
      {
        enable = true;
        settings = {
          terminal.vt = 1;
          default_session = session;
          initial_session = session;
        };
      };
  };
}
