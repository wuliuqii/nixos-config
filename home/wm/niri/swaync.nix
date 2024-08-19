{
  lib,
  config,
  pkgs,
  ...
}:

lib.mkIf config.optional.niri {
  services.swaync = {
    enable = true;
  };
}
