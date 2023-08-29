{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neofetch
    chafa
    imagemagick
  ];
  home.file.".config/neofetch/config.conf".text = import ./config.nix;
}
