{ source, lib, stdenvNoCC, ... }:

stdenvNoCC.mkDerivation {
  inherit (source) pname version src;

  installPhase = ''
    mkdir -p $out/share/rime-data
    cp -r *  $out/share/rime-data
  '';

  meta = with lib; {
    description = "Rime pinyin dict from iDvel";
    homepage = "https://github.com/iDvel/rime-ice";
    license = licenses.gpl3Plus;
  };
}
