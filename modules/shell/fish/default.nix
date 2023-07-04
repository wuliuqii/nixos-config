{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
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
  home.file.".config/fish/fish_variables".text = import ./fish_variables.nix;
  home.file.".config/fish/functions/l.fish".text = import ./functions/l.nix;
  home.file.".config/fish/functions/n.fish".text = import ./functions/n.nix;
  home.file.".config/fish/functions/ls.fish".text = import ./functions/ls.nix;
  home.file.".config/fish/functions/nf.fish".text = import ./functions/nf.nix;
  home.file.".config/fish/functions/vi.fish".text = import ./functions/vi.nix;
  home.file.".config/fish/functions/top.fish".text = import ./functions/top.nix;
  home.file.".config/fish/functions/owf.fish".text = import ./functions/owf.nix;
  home.file.".config/fish/functions/xdg-get.fish".text = import ./functions/xdg-get.nix;
  home.file.".config/fish/functions/xdg-set.fish".text = import ./functions/xdg-set.nix;
  home.file.".config/fish/functions/fish_prompt.fish".source = ./functions/fish_prompt.fish;
}
