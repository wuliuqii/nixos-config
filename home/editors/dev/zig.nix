{
  lib,
  config,
  pkgs,
  ...
}:

lib.mkIf config.optional.dev.zig {

  home.packages = with pkgs; [
    zig
    zls
  ];
}
