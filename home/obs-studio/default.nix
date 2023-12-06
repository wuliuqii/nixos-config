{ pkgs, ... }:

{
  programs = {
    obs-studio.enable = true;
  };

  home.packages = with pkgs; [
    obs-studio-plugins.wlrobs
    obs-studio-plugins.input-overlay
  ];
}
