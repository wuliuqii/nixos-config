{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (fenix.complete.withComponents [
      "rustc"
      "cargo"
      "rustfmt"
      "rust-std"
      "clippy"
    ])
    rust-analyzer-nightly
  ];

  home.file = {
    cargoConfig = {
      text = ''
        [net]
        git-fetch-with-cli = true;
      '';
      target = ".cargo/config.toml";
    };
  };
}
