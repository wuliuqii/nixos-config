{
  lib,
  config,
  pkgs,
  ...
}:

lib.mkIf config.optional.wm {
  catppuccin.gtk.enable = true;
  catppuccin.gtk.icon.enable = true;
  gtk = {
    enable = true;

    font = {
      name = "${config.profile.font}";
      # size = 11;
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = if config.profile.darkMode then "prefer-dark" else "prefer-light";
      };
    };
  };

  home = {
    pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 16;
      x11.enable = true;
      gtk.enable = true;
    };
  };

  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "kvantum";
  };
}
