{ inputs, ... }:

{
  imports = [
    ./hyprland
    ./ags

    ./hyprlock.nix
    ./hypridle.nix
    ./hyprpaper.nix
    ./polkit-agent.nix
    ./anyrun.nix

    inputs.hyprland.homeManagerModules.default
  ];
}
