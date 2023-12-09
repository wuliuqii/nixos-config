{ config, inputs, pkgs, ... }:
let
  user = "${config.machine.userName}";
in
{
  home-manager.users.${user} = {
    imports = [
      ./rofi
      ./waybar

      ./hyprland.nix
      ./mako.nix
      ./swww.nix
      ./gtk.nix
      ./qt.nix
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
    # xserver = {
    #   enable = true;
    #   displayManager.sddm = {
    #     enable = true;
    #     theme = "${pkgs.catppuccin-sddm-corners}";
    #   };
    # };
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
    cliphist
    wlr-randr
    swaylock-effects
    swayidle
    pamixer
    grimblast
    xdg-desktop-portal-hyprland
    gnome.nautilus
    udiskie
    libsForQt5.dolphin
    glib
    libsForQt5.qtstyleplugin-kvantum
  ];

  security.pam.services.swaylock = { };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "wlr";
  };
}
