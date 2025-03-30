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
      #   imagemagick
      #   sassc
      #   brightnessctl
      inotify-tools
      libnotify
      #   wf-recorder
      #   swappy
      #   wayshot
      #   hyprpicker
      wl-clipboard
      #   wl-screenrec
      #   cliphist
      #   wlr-randr
      #   slurp
    ];
  };
}
