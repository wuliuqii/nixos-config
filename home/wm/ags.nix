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
      inputs.ags.packages.${pkgs.system}.io
    ];

    programs.ags = {
      enable = true;
      extraPackages = with pkgs; [
        inputs.ags.packages.${pkgs.system}.mpris
        inputs.ags.packages.${pkgs.system}.wireplumber
        inputs.ags.packages.${pkgs.system}.tray
        inputs.ags.packages.${pkgs.system}.network
        inputs.ags.packages.${pkgs.system}.battery
        inputs.ags.packages.${pkgs.system}.apps
        inputs.ags.packages.${pkgs.system}.auth
        inputs.ags.packages.${pkgs.system}.bluetooth
        inputs.ags.packages.${pkgs.system}.notifd
        inputs.ags.packages.${pkgs.system}.powerprofiles
        inputs.ags.packages.${pkgs.system}.hyprland
      ];
    };
  };
}
