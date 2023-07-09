{ config, inputs, pkgs, ... }:
let
  user = "${config.machine.userName}";
in
{
  imports = [
    ./waybar.nix
  ];
  home-manager.users.${user} = {
    imports = [
      ./hyprland.nix
      { services.mako.enable = true; }
    ];
  };

  programs = {
    dconf.enable = true;
    light.enable = true;
  };

  hardware.opengl.enable = true;

  environment.systemPackages = with pkgs; [
    wl-clipboard
    wlr-randr

    swaylock-effects
    swayidle
    pamixer
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
  ];

  security.pam.services.swaylock = { };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

}
