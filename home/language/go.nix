{ pkgs, ... }:
{
  programs.go = {
    enable = true;
    goPath = "go";
    goBin = "go/bin";
  };


  home.packages = with pkgs; [
    gopls
    gomodifytags
    gotests
    impl
    go-tools
    delve
  ];
}
