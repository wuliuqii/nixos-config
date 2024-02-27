{ lib, ... }:
{
  imports = [
    ./binds.nix
    ./rules.nix
    ./settings.nix
  ];

  home.sessionVariables = {
    # XDG_CURRENT_DESKTOP = "Hyprland";
    # XDG_SESSION_DESKTOP = "Hyprland";
    GDK_SCALE = "2";
  };

  wayland.windowManager.hyprland = {
    enable = true;
  };
}
