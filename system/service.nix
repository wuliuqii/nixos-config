{ config, ... }:
let
  user = "${config.machine.userName}";
in
{
  services = {
    getty.autologinUser = "${user}";
    tlp.enable = true;
    blueman.enable = true;
    dbus.enable = true;
    v2raya.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    keyd = {
      enable = true;
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
}
