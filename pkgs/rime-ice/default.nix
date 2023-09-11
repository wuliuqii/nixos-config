{ lib
, stdenvNoCC
, fetchFromGitHub
, enableUnihan ? false
}:

stdenvNoCC.mkDerivation rec {
  pname = "rime-ice";
  version = "unstable-2023-08-27";

  src = fetchFromGitHub {
    owner = "iDvel";
    repo = pname;
    rev = "c9e4f7a77a3cb5cc70672e93d2943bb77d9a1157";
    hash = "sha256-vQjTs5D/n2A4Py5/A/YVnV2XwASCDxGN7zrjnk7HF1c=";
  };

  installPhase = ''
    mkdir -p $out/share/rime-data
    ${lib.optionalString enableUnihan ''
      sed -e '9s/^ *# /  /' -i rime_ice.dict.yaml
    ''}
    mv double_pinyin_flypy.schema.yaml rime_ice.schema.yaml \
      liangfen.dict.yaml liangfen.schema.yaml \
      melt_eng.dict.yaml melt_eng.schema.yaml \
      rime_ice.dict.yaml \
      symbols_caps_v.yaml symbols_v.yaml \
      cn_dicts/ en_dicts/ \
      opencc lua rime.lua \
      custom_phrase.txt \
      default.yaml \
      $out/share/rime-data
  '';

  meta = with lib; {
    description = "Rime pinyin dict from iDvel";
    homepage = "https://github.com/iDvel/rime-ice";
    license = licenses.gpl3Plus;
  };
}
