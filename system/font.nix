{ pkgs, inputs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;

    packages = with pkgs; [
      # icon fonts
      material-symbols

      # Sans(Serif) fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      roboto

      # monospace fonts
      jetbrains-mono
      inputs.monolisa.packages.${pkgs.system}.monolisa

      # nerdfonts
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];

    fontconfig.defaultFonts =
      let
        addAll = builtins.mapAttrs (k: v: [ "Symbols Nerd Font" ] ++ v ++ [ "Noto Color Emoji" ]);
      in
      addAll {
        serif = [
          "Noto Serif"
          "Noto Serif CJK SC"
        ];
        sansSerif = [
          "Noto Sans"
          "Noto Sans CJK SC"
        ];
        monospace = [
          # "JetBrains Mono"
          "MonoLisa"
        ];
        emoji = [ ];
      };
  };
}
