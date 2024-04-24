{ pkgs, ... }:
{
  imports = [
    ./helix.nix
    ./vscode.nix

    ./nvim
    ./dev
  ];

  home.packages = with pkgs; [
    zed-editor
    jetbrains.rust-rover
  ];
}
