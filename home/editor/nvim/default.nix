{ pkgs, ... }:
let
  version = "1.2.85";
  codeium-ls = pkgs.stdenv.mkDerivation
    {
      name = "codeium";
      src = pkgs.fetchurl {
        url =
          "https://github.com/Exafunction/codeium/releases/download/language-server-v${version}/language_server_linux_x64";
        sha256 = "RNIF+Ie/xOO06SQEZcnMi8+6uTZEtWsmdO52PL5N0F0=";
      };
      nativeBuildInputs = [ pkgs.autoPatchelfHook ];
      unpackPhase = "true";
      installPhase = ''
        ls -lR $src
        mkdir -p $out/bin
        cp $src $out/bin/language_server_linux_x64
        chmod +x $out/bin/language_server_linux_x64
      '';
    };
in
{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    extraLuaPackages = ps: [
      ps.magick
    ];
  };

  home.packages = with pkgs; [
    deno

    neovide
    nodejs
  ];

  home = {
    file = {
      codeium-ls = {
        target = ".local/share/.codeium/bin/${version}/language_server_linux_x64";
        source = "${codeium-ls}/bin/language_server_linux_x64";
      };
    };
  };
}
