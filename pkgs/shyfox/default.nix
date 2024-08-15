{
  sources,
  lib,
  stdenvNoCC,
  ...
}:

stdenvNoCC.mkDerivation {
  inherit (sources.shyfox) pname version src;

  installPhase = ''
    mkdir -p $out/
    cp -r *  $out/
  '';

  meta = with lib; {
    description = "A very shy little theme that hides the entire browser interface in the window border ";
    homepage = "https://github.com/Naezr/ShyFox";
    license = licenses.mpl20;
  };
}
