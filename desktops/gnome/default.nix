{ config, pkgs, ... }:
let
  user = "${config.machine.userName}";
in
{
  home-manager.users.${user} = import ./home.nix;

  programs = {
    dconf.enable = true;
    kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };
  };

  services.xserver = {
    enable = true;
    displayManager = {
      gdm.enable = true;
      autoLogin.enable = true;
      autoLogin.user = "${user}";
    };
    desktopManager.gnome.enable = true;
  };
  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    xterm
  ]) ++ (with pkgs.gnome; [
    cheese
    gedit
    epiphany
    geary
    evince
    gnome-music
    gnome-terminal
    gnome-characters
    gnome-contacts
    gnome-initial-setup
    gnome-calculator
    totem
    tali
    iagno
    hitori
    atomix
    yelp
  ]);

  environment.systemPackages = with pkgs; [
    wl-clipboard

    gnome.dconf-editor
    gnome.gnome-tweaks
    gnome.adwaita-icon-theme
    nordic
    # nordzy-icon-theme
    nordzy-cursor-theme
  ];

}
