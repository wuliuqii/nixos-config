{ pkgs, ... }:
{
  imports = [
    ./helix.nix
    ./vscode.nix
    ./emacs.nix

    ./nvim
    ./dev
  ];

  home.packages = with pkgs; [
    zed-editor
  ];
}
