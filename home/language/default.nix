{ pkgs, ... }:
{
  imports = [
    ./go.nix
    ./rust.nix
  ];

  home.packages = with pkgs; [
    gopls
    gomodifytags
    gotests
    impl
    go-tools
    delve
  ];
}
