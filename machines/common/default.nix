{ lib, pkgs, ... }:
with lib;
{
  options.machine = {
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
      default = "nvim";
    };
    wallpaper = mkOption { type = types.path; };
    lockImage = mkOption { type = types.path; };
    shell = mkOption {
      type = types.package;
      default = pkgs.fish;
    };
    de = mkOption {
      type = types.str;
      default = "hypr";
    };
  };
}
