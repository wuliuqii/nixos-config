{
  lib,
  config,
  pkgs,
  ...
}:

lib.mkIf config.optional.vir {
  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      experimental = true;
      registry-mirrors = [
        "https://docker.mirrors.ustc.edu.cn/"
        "https://docker.m.daocloud.io"
      ];
    };
    extraPackages = with pkgs; [
      docker-compose
    ];
  };

}
