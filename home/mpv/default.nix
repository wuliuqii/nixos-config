{ ... }:

{
  programs = {
    mpv = {
      enable = true;
    };
  };
  home.file.".config/mpv/mpv.conf".source = ./mpv.conf;
}
