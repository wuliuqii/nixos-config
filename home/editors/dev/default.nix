{ pkgs, ... }:
{
  imports = [
    ./go.nix
    ./rust.nix
    ./zig.nix
    ./node.nix
  ];

  home.packages = with pkgs; [
    # nil
    nixpkgs-fmt
    nixfmt-rfc-style
    nil

    # markdown
    marksman

    # lua
    lua-language-server
    stylua

    # typst
    typstfmt
    tinymist

    # json
    vscode-langservers-extracted

    # build tools
    gcc
    gnumake
    pkg-config
  ];
}
