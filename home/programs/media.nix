{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      mpc-cli
      g4music
      go-musicfox
      yesplaymusic
      playerctl
      pavucontrol
      cava
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
