{ pkgs, user, ... }:

{
  imports =
    [ (import ../../modules/desktop/hyprland/home.nix) ] ++
    [ (import ../../modules/scripts) ] ++
    [ (import ../../secrets/home.nix) ] ++
    (import ../../modules/shell) ++
    (import ../../modules/programs/wayland) ++
    (import ../../modules/theme/nord/wayland);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      gnumake
      nix-output-monitor
      age
      sops
      thefuck
    ];
  };

  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "23.05";
}
