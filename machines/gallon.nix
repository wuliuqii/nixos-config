{ pkgs, ... }:
{
  imports = [
    ./common
  ];
  machine = {
    userName = "gallon";
    userEmail = "h1090703848@gmail.com";
    hashedPassword = "$6$8/ZJ0jr/BWf4at92$PmRuEML2eiCHcRe/vuc54xgSkU.T7bO6ljUqczhkpw3kAv1mTl.PLMOhRuG.yIiEklJGwcHq3szit4PPkZaEM0";
    shell = pkgs.fish;
    browser = "firefox";
    terminal = "wezterm";
    wallpaper = ../wallpaper/catppuccin/evening-sky.png;
    lockImage = ../wallpaper/catppuccin/windows-error.jpg;
  };
}
