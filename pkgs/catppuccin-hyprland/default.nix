{ sources, lib, stdenvNoCC, }:
stdenvNoCC.mkDerivation {
  inherit (sources.catppuccin-hyprland) pname version src;

  dontBuild = true;
  dontConfigure = true;

  installPhase = "
    mkdir -p $out
    cp -r themes/* $out/
  ";

  meta = with lib; {
    description = "🌻 Soothing pastel theme for Hyprland ";
    homepage = "https://github.com/catppuccin/hyprland";
    license = licenses.mit;
  };
}
