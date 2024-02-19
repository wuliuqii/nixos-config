{ sources, stdenv, lib, ... }:
stdenv.mkDerivation {
  inherit (sources.fcitx5-pinyin-moegirl) pname version src;

  dontUnpack = true;
  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    install -Dm444 $src $out/share/fcitx5/pinyin/dictionaries/moegirl.dict
  '';

  meta = with lib; {
    description = "Fcitx5 pinyin dictionary from zh.moegirl.org.cn ";
    homepage = "https://github.com/outloudvi/mw2fcitx";
    license = licenses.unlicense;
  };
}
