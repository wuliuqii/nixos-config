{ config, pkgs, ... }:
{
  gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      # size = 11;
    };

    gtk3.extraCss = ''
      headerbar, .titlebar,
      .csd:not(.popup):not(tooltip):not(messagedialog) decoration{
        border-radius: 0;
      }
    '';

    gtk4.extraCss = ''
      window.messagedialog .response-area > button,
      window.dialog.message .dialog-action-area > button,
      .background.csd{
        border-radius: 0;
      }
    '';

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
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
    # pointerCursor = {
    #   package = pkgs.bibata-cursors;
    #   name = "Bibata-Modern-Ice";
    #   size = 24;
    #   x11.enable = true;
    #   gtk.enable = true;
    # };
    pointerCursor = {
      package = pkgs.qogir-icon-theme;
      name = "Qogir";
      size = 24;
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
