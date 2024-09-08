{ inputs, ... }:

{
  imports = [
    ./hyprland

    ./hyprlock.nix
    ./hypridle.nix
    ./hyprpaper.nix
    ./polkit-agent.nix

    inputs.hyprland.homeManagerModules.default
  ];
}
