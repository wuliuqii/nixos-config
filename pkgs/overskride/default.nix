{ source
, stdenv
, lib
, rustPlatform
, cargo
, rustc
, meson
, ninja
, pkg-config
, wrapGAppsHook4
, desktop-file-utils
, appstream-glib
, blueprint-compiler
, dbus
, gtk4
, libadwaita
, bluez
, libpulseaudio
,
}:
stdenv.mkDerivation {
  inherit (source) pname version src;

  cargoDeps = rustPlatform.importCargoLock {
    lockFile = ../_sources/${source.pname}-${source.version}/Cargo.lock;
  };

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    pkg-config
    wrapGAppsHook4
    desktop-file-utils
    appstream-glib
    blueprint-compiler
    meson
    ninja
    cargo
    rustc
  ];

  buildInputs = [ dbus gtk4 libadwaita bluez libpulseaudio ];

  preFixup = ''
    glib-compile-schemas $out/share/gsettings-schemas/${source.pname}-${source.version}/glib-2.0/schemas
  '';

  meta = with lib; {
    description = "A Bluetooth and Obex client that is straight to the point, DE/WM agnostic, and beautiful";
    homepage = "https://github.com/kaii-lb/overskride";
    changelog = "https://github.com/kaii-lb/overskride/blob/v${source.version}/CHANGELOG.md";
    license = licenses.gpl3Only;
    mainProgram = pname;
    maintainers = with maintainers; [ mrcjkb ];
    platforms = platforms.linux;
  };
}
