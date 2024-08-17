{ ... }:
{
  services = {
    # getty.autologinUser = "${user}";
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    minecraft-servers = {
      enable = false;
      eula = true;
      # dataDir = $HOME/Documents/minecraft;
      servers.survival = {
        enable = true;
      };
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
