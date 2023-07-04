{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    functions = {
      gitignore = "curl -sL https://www.gitignore.io/api/$argv";
    };
    shellAbbrs = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd .././..";
      l = "exa";
      ls = "exa";
      vim = "hx";
      grep = "rg";
      c = "clear";
      top = "btop";
      lg = "lazygit";
    };
    plugins = [
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "ddeb28a7b6a1f0ec6dae40c636e5ca4908ad160a";
          sha256 = "0c5i7sdrsp0q3vbziqzdyqn4fmp235ax4mn4zslrswvn8g3fvdyh";
        };
      }
    ];
  };
}

