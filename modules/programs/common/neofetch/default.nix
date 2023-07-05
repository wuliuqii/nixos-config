{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neofetch
    imagemagick
  ];
  home.file.".config/neofetch/config.conf".text = import ./config.nix;
}
