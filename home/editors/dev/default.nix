{ pkgs, ... }:
{
  imports = [
    ./go.nix
    ./rust.nix
    ./ts.nix
  ];

  home.packages = with pkgs; [
    # lsp
    # nil
    nixpkgs-fmt
    nil

    # markdown
    marksman

    # lua
    lua-language-server
    stylua

    nodePackages.prettier
  ];
}
