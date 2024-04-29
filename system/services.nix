{ lib, config, pkgs, ... }:
let
  user = "${config.machine.userName}";
in
{
  services = {
    # getty.autologinUser = "${user}";
    v2raya.enable = true;
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
  };
}
