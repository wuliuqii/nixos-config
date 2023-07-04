{ inputs, pkgs, ... }:
{
  imports = [ ../../programs/wayland/waybar ];
  programs = {
    dconf.enable = true;
    light.enable = true;
  };

  hardware.opengl.enable = true;

  environment.systemPackages = with pkgs; [
    swaylock-effects
    pamixer
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
  ];

  security.pam.services.swaylock = { };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

}
