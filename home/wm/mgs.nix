{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.optional.wm {
    home.packages = with pkgs; [
      inotify-tools
      libnotify
      wl-clipboard

      inputs.mgs.packages.${pkgs.system}.default
    ];
  };
}
