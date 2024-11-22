{
  lib,
  config,
  pkgs,
  ...
}:

lib.mkIf config.optional.wm {
  gtk = {
    enable = true;
    catppuccin.enable = true;
    catppuccin.icon.enable = true;
    font = {
      name = "${config.profile.font}";
      # size = 11;
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

  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "kvantum";
  };
}
