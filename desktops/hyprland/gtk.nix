{ pkgs, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.nordzy-cursor-theme;
    name = "Nordzy-cursors";
    size = 24;
  };
  gtk = {
    enable = true;
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };
    # iconTheme = {
    #   name = "Nordzy";
    #   package = pkgs.nordzy-icon-theme;
    # };

    font = {
      name = "JetBrainsMono Nerd Font";
      # size = 16;
    };
  };
}
