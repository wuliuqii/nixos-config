{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      lxgw-wenkai
      lxgw-neoxihei
      source-han-sans
      jetbrains-mono
      inter
      nerdfonts
    ];

    fontconfig.defaultFonts = pkgs.lib.mkForce {
      serif = [ "Noto Serif" "Noto Serif CJK SC" ];
      sansSerif = [ "Noto Sans" "Noto Sans CJK SC" ];
      monospace = [ "JetBrains Mono" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
