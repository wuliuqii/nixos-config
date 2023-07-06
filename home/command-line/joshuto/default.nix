{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      joshuto
      file
      bat
      exiftool
      qimgv
    ];
  };
  home.file.".config/joshuto".source = ./config;
}
