{ sources, stdenvNoCC, ... }:

stdenvNoCC.mkDerivation {
  inherit (sources.wallpaper) pname version src;

  installPhase = ''
    mkdir -p $out/
    cp -r *  $out/
  '';
}
