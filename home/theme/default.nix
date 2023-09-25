{ pkgs, ... }:
let
  mocha = pkgs.catppuccin-gtk.override {
    accents = [ "pink" ];
    size = "standard";
    tweaks = [ "normal" ];
    variant = "mocha";
  };
  latte = pkgs.catppuccin-gtk.override {
    accents = [ "pink" ];
    size = "standard";
    tweaks = [ "normal" ];
    variant = "latte";
  };
in
{
  home.packages = with pkgs; [
    tela-circle-icon-theme
    tela-icon-theme
    bibata-cursors
    tokyo-night-gtk
    rose-pine-gtk-theme
    rose-pine-icon-theme
    latte
    mocha
  ];

  home.file = {
    ".themes/Catppuccin-Mocha-Standard-Pink-dark".source =
      "${mocha}/share/themes/Catppuccin-Mocha-Standard-Pink-dark";
    ".themes/Catppuccin-Latte-Standard-Pink-light".source =
      "${latte}/share/themes/Catppuccin-Latte-Standard-Pink-light";
    ".themes/Tokyonight-Storm".source =
      "${pkgs.tokyo-night-gtk}/share/themes/Tokyonight-Storm-B";
    ".themes/Nordic".source =
      "${pkgs.nordic}/share/themes";

    ".icons/Bibata-Modern-Ice".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Ice";
    ".icons/Tela-black".source = "${pkgs.tela-icon-theme}/share/icons/Tela-black";
    ".icons/Tela-blue".source = "${pkgs.tela-icon-theme}/share/icons/Tela-blue";
    ".icons/Tela-dracula".source =
      "${pkgs.tela-icon-theme}/share/icons/Tela-dracula";
    ".icons/Tela-green".source = "${pkgs.tela-icon-theme}/share/icons/Tela-green";
    ".icons/Tela-grey".source = "${pkgs.tela-icon-theme}/share/icons/Tela-grey";
    ".icons/Tela-pink".source = "${pkgs.tela-icon-theme}/share/icons/Tela-pink";
    ".icons/Tela-purple".source =
      "${pkgs.tela-icon-theme}/share/icons/Tela-purple";
    ".icons/Tela-yellow".source =
      "${pkgs.tela-icon-theme}/share/icons/Tela-yellow";
  };
}
