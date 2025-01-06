{
  config,
  lib,
  ...
}:

lib.mkIf config.optional.wm {
  catppuccin.wlogout = {
    enable = true;
  };
  programs.wlogout = {
    enable = true;
  };
}
