{ pkgs, ... }:
{
  imports = [
    ./helix.nix
    ./vscode.nix

    ./dev
  ];

  home.packages = with pkgs.jetbrains; [
    rust-rover
    goland
  ];
}
