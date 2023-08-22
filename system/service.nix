{ config, ... }:
let
  user = "${config.machine.userName}";
in
{
  services = {
    getty.autologinUser = "${user}";
    blueman.enable = true;
    dbus.enable = true;
    v2raya.enable = true;
    syncthing.enable = true;

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
            alt = {
              h = "left";
              j = "down";
              k = "up";
              l = "right";
            };
          };
        };
      };
    };
  };
}
