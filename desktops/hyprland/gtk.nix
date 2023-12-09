{ pkgs, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Standard-Pink";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "pink" ];
        size = "standard";
        tweaks = [ "normal" "black" ];
        variant = "macchiato";
      };
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };
    iconTheme = {
      name = "Tela-dracula";
      package = pkgs.tela-icon-theme;
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      # size = 16;
    };
  };
}
