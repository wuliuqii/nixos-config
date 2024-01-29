{ inputs, pkgs, ... }:

{
  programs = {
    dconf.enable = true;
    light.enable = true;
    kdeconnect.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
    };
  };

  # use Wayland where possible (electron)
  # vscode startup crash
  # environment.variables.NIXOS_OZONE_WL = "1";

  # enable location service
  location.provider = "geoclue2";

  xdg.portal = {
    enable = true;
    # xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
    config = {
      common.default = [ "gtk" ];
      hyprland.default = [ "hyprland" "gtk" ];
    };
  };
}
