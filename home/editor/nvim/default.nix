{ pkgs, ... }:
let
  codeium-ls = pkgs.stdenv.mkDerivation
    {
      name = "codeium";
      src = pkgs.fetchurl {
        url =
          "https://github.com/Exafunction/codeium/releases/download/language-server-v1.2.77/language_server_linux_x64";
        sha256 = "1hq67vqn7p3bfpli66j49piav9by4cc7nbzb306yv87imvlcfdsk";
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
  ];

  home = {
    file = {
      codeium-ls = {
        target = ".local/share/.codeium/bin/nix/language_server_linux_x64";
        source = "${codeium-ls}/bin/language_server_linux_x64";
      };
    };
  };

  # home.file.".config/nvim".source = ./config;
}
