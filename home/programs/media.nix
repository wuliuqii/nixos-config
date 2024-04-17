{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      g4music
      music-player
      netease-cloud-music-gtk
      termusic
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
}
