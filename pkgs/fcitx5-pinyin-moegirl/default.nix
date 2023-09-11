{ stdenv
, lib
, ...
}:
let
  pname = "fcitx5-pinyin-moegirl";
  version = "20230814";

  src = builtins.fetchurl {
    url = "https://github.com/outloudvi/mw2fcitx/releases/download/${version}/moegirl.dict";
    sha256 = "0m6f3rg7rcgfhf4y8zyw40j3qy7pvzknf08kc73mw4266j98niii";
  };
in
stdenv.mkDerivation {
  inherit pname version src;
  dontUnpack = true;
  installPhase = ''
    install -Dm644 $src $out/share/fcitx5/pinyin/dictionaries/moegirl.dict
  '';
  meta = with lib; {
    description = "Fcitx5 pinyin dictionary from zh.moegirl.org.cn ";
    homepage = "https://github.com/outloudvi/mw2fcitx";
    license = licenses.unlicense;
  };
}
