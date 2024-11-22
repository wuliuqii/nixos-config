{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      g4music
      netease-cloud-music-gtk
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

    # cava = {
    #   enable = true;
    #   catppuccin.enable = true;
    # };
  };
}
