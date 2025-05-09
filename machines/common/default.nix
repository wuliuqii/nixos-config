{ lib, pkgs, ... }:
with lib;
{

  options = {
    profile = {
      userName = mkOption {
        type = types.str;
        default = "gallon";
      };
      userEmail = mkOption {
        type = types.str;
        default = "h1090703848@gmail.com";
      };
      hashedPassword = mkOption {
        type = types.str;
        default = "$6$8/ZJ0jr/BWf4at92$PmRuEML2eiCHcRe/vuc54xgSkU.T7bO6ljUqczhkpw3kAv1mTl.PLMOhRuG.yIiEklJGwcHq3szit4PPkZaEM0";
      };
      browser = mkOption {
        type = types.str;
        default = "firefox";
      };
      terminal = mkOption {
        type = types.str;
        default = "kitty";
      };
      editor = mkOption {
        type = types.str;
        default = "vi";
      };
      shell = mkOption {
        type = types.package;
        default = pkgs.fish;
      };
      font = mkOption {
        type = types.str;
        default = "JetBrains Mono";
      };
      darkMode = mkOption {
        type = types.bool;
        default = true;
      };
      wallpaper = mkOption {
        type = types.str;
        default = "${pkgs.wallpaper}/catppuccin/evening-sky.png";
      };
    };

    optional = {
      wm = lib.mkEnableOption "wm profile" // {
        default = true;
      };
      hypr = {
        enable = lib.mkEnableOption "hyprland profile" // {
          default = true;
        };
      };
      niri = lib.mkEnableOption "niri profile" // {
        default = false;
      };

      podman = lib.mkEnableOption "podman profile";

      terminal = {
        wezterm = lib.mkEnableOption "wezterm profile";
        kitty = lib.mkEnableOption "kitty profile";
        foot = lib.mkEnableOption "foot profile";
      };

      dev = {
        helix = lib.mkEnableOption "helix profile";
        zed = lib.mkEnableOption "zed profile";
        vscode = lib.mkEnableOption "vscode profile";

        go = lib.mkEnableOption "go profile";
        rust = lib.mkEnableOption "rust profile";
        zig = lib.mkEnableOption "zig profile";
        node = lib.mkEnableOption "node profile";
      };
    };
  };
}
