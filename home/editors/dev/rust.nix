{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (rust-bin.selectLatestNightlyWith (toolchain: toolchain.default))

    taplo
  ];

  home.file = {
    cargoConfig = {
      text = ''
        [source.crates-io]
        replace-with = 'rsproxy-sparse'
        [source.rsproxy]
        registry = "https://rsproxy.cn/crates.io-index"
        [source.rsproxy-sparse]
        registry = "sparse+https://rsproxy.cn/index/"
        [registries.rsproxy]
        index = "https://rsproxy.cn/crates.io-index"
        [net]
        git-fetch-with-cli = true
        [build]
        rustflags = ["-Z", "threads=8"]
      '';
      target = ".cargo/config.toml";
    };
  };
}
