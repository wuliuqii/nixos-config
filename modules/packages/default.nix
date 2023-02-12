{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    (callPackage ./catppuccin-gtk {})
    (callPackage ./catppuccin-cursors {}).macchiatoPink
  ];
}
