{ ... }:
{
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
  };

  home.file.".config/zellij/config.kdl".source = ./config.kdl;
}
