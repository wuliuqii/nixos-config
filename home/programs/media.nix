{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      g4music
      youtube-music
      go-musicfox
      yesplaymusic
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
