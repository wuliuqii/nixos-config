{ pkgs, lib, ... }:
let
  pname = "fcitx5-pinyin-zhwiki";
  version = "0.2.4";
  tag = "20230823";
  src = builtins.fetchurl {
    url = "https://github.com/felixonmars/fcitx5-pinyin-zhwiki/releases/download/${version}/zhwiki-${tag}.dict";
    sha256 = "0vqayg1mmlf0cy0jhfassb14b8ivfsn04sffjxl3akdispq4vwk8";
  };
in
pkgs.stdenv.mkDerivation {
  inherit version src; name = pname;
  dontUnpack = true;
  installPhase = ''
    install -Dm644 $src $out/share/fcitx5/pinyin/dictionaries/zhwiki.dict
  '';
  meta = with lib; {
    description = "Fcitx5 pinyin dictionary from zh.wikipedia.org";
    homepage = "https://github.com/felixonmars/fcitx5-pinyin-zhwiki";
    license = licenses.unlicense;
  };
}
