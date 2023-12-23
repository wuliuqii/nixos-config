{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      mpc-cli
      go-musicfox
      yesplaymusic
      playerctl
      pavucontrol
    ];
  };

  programs = {
    mpv = {
      enable = true;
      defaultProfiles = [ "gpu-hq" ];
      scripts = [ pkgs.mpvScripts.mpris ];
    };
  };

  services.playerctld.enable = true;
}