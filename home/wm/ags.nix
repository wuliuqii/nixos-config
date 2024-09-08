{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [ inputs.ags.homeManagerModules.default ];

  config = lib.mkIf config.optional.wm {
    home.packages = with pkgs; [
      imagemagick
      sassc
      glib
      brightnessctl
      inotify-tools
      libnotify
      wf-recorder
      swappy
      wayshot
      hyprpicker
      wl-clipboard
      wl-screenrec
      cliphist
      wlr-randr
      slurp
    ];

    programs.ags = {
      enable = true;
    };
  };
}
