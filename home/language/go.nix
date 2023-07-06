{ pkgs, ... }:
{
  programs.go = {
    enable = true;
    goPath = "go";
    goBin = "go/bin";
  };


  home.packages = with pkgs; [
    # lsp
    # nil
    nixpkgs-fmt
    nil

    # markdown
    marksman
  ];
}
