{
  sources,
  lib,
  stdenvNoCC,
  ...
}:

stdenvNoCC.mkDerivation {
  inherit (sources.rime-ice) pname version src;

  # buildPhase = ''
  #   mv default.yaml rime_ice_suggestion.yaml
  # '';

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
