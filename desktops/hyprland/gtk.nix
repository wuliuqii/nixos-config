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
      name = "Nordic";
      package = pkgs.nordic;
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
