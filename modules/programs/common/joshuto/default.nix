{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      joshuto
      file
      exiftool
      qimgv
    ];
  };
  home.file.".config/joshuto".source = ./config;
}
