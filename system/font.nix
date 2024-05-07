{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      source-han-sans
      jetbrains-mono
      roboto
      (google-fonts.override { fonts = [ "Inter" ]; })
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];


    fontconfig.defaultFonts =
      let
        addAll = builtins.mapAttrs (k: v: [ "Symbols Nerd Font" ] ++ v ++ [ "Noto Color Emoji" ]);
      in
      addAll {
        serif = [ "Noto Serif" "Noto Serif CJK SC" ];
        sansSerif = [ "Noto Sans" "Noto Sans CJK SC" ];
        monospace = [ "JetBrains Mono" ];
        emoji = [ ];
      };
  };
}
