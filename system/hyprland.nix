{ config, pkgs, ... }:
let
  user = "${config.machine.userName}";
in
{
  programs = {
    dconf.enable = true;
    light.enable = true;
    kdeconnect.enable = true;
  };

  hardware.opengl.enable = true;

  services = {
    getty.autologinUser = "${user}";
    tlp.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    udisks2.enable = true;
  };

  security.pam.services.swaylock = { };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "wlr";
  };
}
