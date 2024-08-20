{
  lib,
  config,
  pkgs,
  ...
}:

lib.mkIf config.optional.dev.zed { home.packages = with pkgs; [ zed-editor ]; }
