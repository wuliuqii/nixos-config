{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      g4music
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
