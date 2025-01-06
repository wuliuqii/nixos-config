{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      g4music
      netease-cloud-music-gtk
      ikun-music-desktop
      pavucontrol
    ];
  };

  catppuccin.mpv.enable = true;
  programs = {
    mpv = {
      enable = true;

      defaultProfiles = [ "gpu-hq" ];
      scripts = [ pkgs.mpvScripts.mpris ];
    };

    # cava = {
    #   enable = true;
    #
    # };
  };
}
