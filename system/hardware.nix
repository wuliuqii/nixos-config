{ pkgs, ... }:
{
  hardware = {
    bluetooth = {
      enable = true;
      package = pkgs.bluez5-experimental;
    };

    # smooth backlight control
    brillo.enable = true;

    opengl.enable = true;
  };
}
