{ pkgs, ... }:
{
  hardware = {
    bluetooth = {
      enable = true;
      package = pkgs.bluez5-experimental;
    };

    graphics.enable = true;
  };
}
