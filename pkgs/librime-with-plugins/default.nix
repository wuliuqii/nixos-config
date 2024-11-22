{
  lib,
  sources,
  librime,
  luajit,
  ...
}:
(librime.override {
  plugins = [
    (sources.librime-charcode.src.overrideAttrs (old: {
      name = "librime-charcode";
    }))
    (sources.librime-lua.src.overrideAttrs (old: {
      name = "librime-lua";
    }))
    (sources.librime-proto.src.overrideAttrs (old: {
      name = "librime-proto";
    }))
  ];
}).overrideAttrs
  (old: {
    buildInputs = (old.buildInputs or [ ]) ++ [ luajit ];

    meta = old.meta // {
      description = "Librime with plugins (librime-charcode, librime-lua, librime-proto)";
    };
  })
