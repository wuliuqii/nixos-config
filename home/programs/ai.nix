{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      claude-code
      gemini-cli
      code-cursor-fhs
    ];
  };
}
