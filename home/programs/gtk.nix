{ config, pkgs, ... }:
{
  gtk = {
    enable = true;

    theme = {
      name = "Catppuccin-Macchiato-Standard-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "standard";
        tweaks = [ "normal" "black" ];
        variant = "macchiato";
      };
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        accent = "mauve";
        flavor = "macchiato";
      };
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      # size = 11;
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
  };

  home = {
    pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
      x11.enable = true;
      gtk.enable = true;
    };
  };

  home.sessionVariables = {
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    CALIBRE_USE_DARK_PALETTE = "1";
  };

  xdg.configFile."kdeglobals".source = "${(pkgs.catppuccin-kde.override {
    flavour = ["macchiato"];
    accents = ["mauve"];
    winDecStyles = ["modern"];
  })}/share/color-schemes/CatppuccinMacchiatoMauve.colors";
}
