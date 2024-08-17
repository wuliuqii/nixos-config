{ lib, config, ... }:

lib.mkIf config.optional.cosmic {
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
}
