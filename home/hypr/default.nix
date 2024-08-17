{ inputs, ... }:

{
  imports = [
    ./hyprland
    ./ags
    ./services

    ./hyprlock.nix
    ./wlogout.nix
    ./anyrun.nix
    ./theme.nix

    inputs.hyprland.homeManagerModules.default
    inputs.ags.homeManagerModules.default
    inputs.anyrun.homeManagerModules.default
  ];
}
