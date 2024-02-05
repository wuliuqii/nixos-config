{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    viAlias = true;
    vimAlias = true;
    # copilot chat dependency
    withPython3 = true;
    extraPython3Packages = (ps: with ps; [
      pynvim
      prompt-toolkit
      requests
      python-dotenv
      tiktoken
    ]);
  };
}
