{ source, pkgs, lib, ... }:
pkgs.stdenv.mkDerivation {
  inherit (source) pname version src;

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    mkdir -p $out/share/fcitx5/themes/
    cp -r src/* $out/share/fcitx5/themes/
  '';

  meta = with lib; {
    description = "Fcitx5 theme based on Catppuccin color";
    homepage = "https://github.com/catppuccin/fcitx5";
    license = licenses.unlicense;
  };
}
