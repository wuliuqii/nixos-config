{
  sources,
  appimageTools,
  ...
}:
let
  pname = sources.ikun-music-desktop.pname;
  version = sources.ikun-music-desktop.version;
  src = sources.ikun-music-desktop.src;
in
appimageTools.wrapType2 {
  inherit pname version src;
}
