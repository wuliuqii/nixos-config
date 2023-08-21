{ pkgs, ... }:
let
  codeium-ls = pkgs.stdenv.mkDerivation
    {
      name = "codeium";
      src = pkgs.fetchurl {
        url =
          "https://github.com/Exafunction/codeium/releases/download/language-server-v1.2.66/language_server_linux_x64";
        sha256 = "QYQLPHFMnX5JH2o75VCxSebWml7OHM5dRsXkvT86jpE=";
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
  };

  home.packages = with pkgs; [
    deno
  ];

  home = {
    file = {
      codeium-ls = {
        target = ".local/share/.codeium/bin/1d8674ba02bba15c9ec356998ccb83b2eaae67d3/language_server_linux_x64";
        source = "${codeium-ls}/bin/language_server_linux_x64";
      };
    };
  };

  # home.file.".config/nvim".source = ./config;
}
