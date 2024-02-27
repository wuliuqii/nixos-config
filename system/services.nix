{ lib, config, pkgs, ... }:
let
  user = "${config.machine.userName}";
in
{
  services = {
    # getty.autologinUser = "${user}";
    v2raya.enable = true;
    blueman.enable = true;
    # battery info & stuff
    upower.enable = true;
    power-profiles-daemon.enable = true;
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    # needed for GNOME services outside of GNOME Desktop
    dbus.packages = [ pkgs.gcr ];
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings = {
            main = {
              capslock = "overload(control, esc)";
              rightalt = "layer(alt)";
            };
          };
        };
      };
    };

    greetd =
      let
        session = {
          command = "${lib.getExe config.programs.hyprland.package}";
          user = user;
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
