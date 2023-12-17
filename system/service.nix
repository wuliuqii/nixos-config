{ pkgs, ... }:
{
  services = {
    blueman.enable = true;
    v2raya.enable = true;

    # battery info & stuff
    upower.enable = true;

    gnome.gnome-keyring.enable = true;
    # needed for GNOME services outside of GNOME Desktop
    dbus.packages = [ pkgs.gcr ];

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

    clight = {
      enable = true;
      settings = {
        verbose = true;
        backlight.disabled = true;
        dpms.timeouts = [ 900 300 ];
        dimmer.timeouts = [ 870 270 ];
        gamma.long_transition = true;
        screen.disabled = true;
      };
    };
  };
}
