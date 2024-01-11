{ pkgs, ... }:
{
  hardware = {
    bluetooth = {
      enable = true;
      package = pkgs.bluez5-experimental;
    };

    opengl.enable = true;
  };
}
