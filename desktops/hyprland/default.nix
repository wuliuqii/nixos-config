{ config, inputs, pkgs, ... }:
let
  user = "${config.machine.userName}";
in
{
  home-manager.users.${user} = {
    imports = [
      ./rofi

      ./hyprland.nix
      ./waybar.nix
      ./mako.nix
      ./swww.nix
      ./gtk.nix
    ];
  };

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

  environment.systemPackages = with pkgs; [
    wl-clipboard
    cliphist
    wlr-randr
    swaylock-effects
    swayidle
    pamixer
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    xdg-desktop-portal-hyprland
    gnome.nautilus
    udiskie
  ];

  security.pam.services.swaylock = { };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
}
