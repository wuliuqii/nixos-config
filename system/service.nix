{ ... }:
{
  services = {
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
          };
        };
      };
    };
  };
}
