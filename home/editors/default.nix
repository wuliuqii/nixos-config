{ pkgs, ... }:
{
  imports = [
    ./helix.nix
    ./vscode.nix

    ./dev
  ];

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
  };

  # home.packages = with pkgs.jetbrains; [
  #   rust-rover
  #   goland
  # ];
}
