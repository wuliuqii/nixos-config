{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      g4music
      music-player
      netease-cloud-music-gtk
      termusic
      pavucontrol
    ];
  };

  programs = {
    mpv = {
      enable = true;
      catppuccin.enable = true;
      defaultProfiles = [ "gpu-hq" ];
      scripts = [ pkgs.mpvScripts.mpris ];
    };

    cava = {
      enable = true;
      catppuccin.enable = true;
    };
  };
}
