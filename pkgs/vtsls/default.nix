{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
  importNpmLock,
  ...
}:

buildNpmPackage rec {
  pname = "vtsls";
  version = "0.2.5";

  src = fetchFromGitHub {
    owner = "yioneko";
    repo = "vtsls";
    rev = "server-v${version}";
    hash = "sha256-4tuVM1mT3NvtJgFf6EdTZmW5PfdiMv7lj2wCSgOOvcc=";
    fetchSubmodules = true;
  };

  sourceRoot = "${src.name}/packages/server";

  npmDeps = importNpmLock {
    npmRoot = "${src}/packages/server";
    packageLock = lib.importJSON ./package-lock.json;
  };

  npmConfigHook = importNpmLock.npmConfigHook;

  dontNpmPrune = true;

  meta = with lib; {
    description = "LSP wrapper around TypeScript extension bundled with VSCode.";
    homepage = "https://github.com/yioneko/vtsls";
    license = licenses.mit;
    maintainers = with maintainers; [ wizardlink ];
    platforms = platforms.all;
  };
}
