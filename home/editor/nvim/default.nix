{ pkgs, ... }:
let
  version = "1.2.78";
  codeium-ls = pkgs.stdenv.mkDerivation
    {
      name = "codeium";
      src = pkgs.fetchurl {
        url =
          "https://github.com/Exafunction/codeium/releases/download/language-server-v${version}/language_server_linux_x64";
        sha256 = "kIegct5+ilTm+q7rlM0CwJXwywKZavwNGnuG82CUkLk=";
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

  home.file.".config/github-copilot/hosts.json".text = ''
    {"github.com":{"user":"cocopilot","oauth_token":"ghu_ThisIsARealFreeCopilotKeyByCoCopilot","dev_override":{"copilot_token_url":"https://api.cocopilot.org/copilot_internal/v2/token"}}}
  '';
}
