{ config, pkgs, ... }:
let
  user = "${config.machine.userName}";
in
{
  # home-manager.users.${user} = import ./home.nix;

  programs = {
    dconf.enable = true;
    kdeconnect = {
      enable = true;
    };
  };

  services.xserver = {
    enable = true;
    displayManager = {
      gdm.enable = true;
      autoLogin.enable = true;
      autoLogin.user = "${user}";
      defaultSession = "plasmawayland";
    };
    desktopManager.plasma5.enable = true;
  };

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    gwenview
    okular
    oxygen
    khelpcenter
    konsole
    plasma-browser-integration
    print-manager
  ];
}
