{ sources, stdenvNoCC, lib, ... }:
stdenvNoCC.mkDerivation {
  inherit (sources.fcitx5-pinyin-zhwiki) pname version src;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/rime-data
    cp $src $out/share/rime-data/zhwiki.dict.yaml
  '';

  meta = with lib; {
    description = "Fcitx5 pinyin dictionary from zh.wikipedia.org";
    homepage = "https://github.com/felixonmars/fcitx5-pinyin-zhwiki";
    license = licenses.unlicense;
  };
}
