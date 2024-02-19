{ sources, lib, stdenvNoCC, }:
stdenvNoCC.mkDerivation {
  inherit (sources.catppuccin-fish) pname version src;

  installPhase = "
    install -Dvm444 -t $out/share/fish/tools/web_config/themes $src/themes/*
  ";

  meta = with lib; {
    description = "🐟 Soothing pastel theme for the Fish Shell ";
    homepage = "https://github.com/catppuccin/fish";
    license = licenses.mit;
  };
}
