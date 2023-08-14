{ pkgs, ... }:
{
  imports = [
    ./helix.nix
    ./vscode.nix

    ./emacs
    ./nvim
  ];
}
