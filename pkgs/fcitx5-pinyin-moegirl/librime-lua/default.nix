{ stdenv
, lib
, fetchFromGitHub
, lua5_4
}:

stdenv.mkDerivation rec {
  pname = "librime-lua";
  version = "ustable-2023-06-25";

  src = fetchFromGitHub {
    owner = "hchunhui";
    repo = pname;
    rev = "c985eb399d63c491c6e03fa1651ddb59e485c04a";
    hash = "sha256-tpyX0NxAlNZ4Qeml2BeM0NbPN5xDW/uH/f0eqjBQKIM=";
  };

  buildInputs = [ lua5_4 ];

  installPhase = ''
    mkdir -p $out
    cp -r $src/* $out
  '';

  meta = with lib; {
    description = "Extending RIME with Lua scripts";
    homepage = "https://github.com/hchunhui/librime-lua";
    license = licenses.bsd3;
  };
}
