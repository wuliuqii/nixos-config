{ sources, stdenv, lib, ... }:
stdenv.mkDerivation {
  inherit (sources.fcitx5-pinyin-moegirl) pname version src;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/rime-data
    cp $src $out/share/rime-data/moegirl.dict.yaml
  '';

  meta = with lib; {
    description = "Fcitx5 pinyin dictionary from zh.moegirl.org.cn ";
    homepage = "https://github.com/outloudvi/mw2fcitx";
    license = licenses.unlicense;
  };
}
