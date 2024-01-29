{ config, pkgs, ... }:
{
  gtk = {
    enable = true;

    theme = {
      name = "Materia-dark-compact";
      package = pkgs.materia-theme;
    };

    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      # size = 11;
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "gtk2";
      package = config.gtk.theme.package;
    };
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
