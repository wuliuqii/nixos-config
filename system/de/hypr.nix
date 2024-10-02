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
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  services = {
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
