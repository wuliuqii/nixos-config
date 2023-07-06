{ config, ... }:
let
  user = "${config.machine.userName}";
  home = "/home/${user}";
in
{
  home-manager.users.${user} = import ./home.nix;

  sops.secrets.id_ed22519 = {
    format = "binary";
    sopsFile = ./id_ed25519;
    owner = "${user}";
    path = "${home}/.ssh/id_ed25519";
  };

  sops.secrets.ssh-config = {
    format = "binary";
    sopsFile = ./ssh_config;
    owner = "${user}";
    path = "${home}/.ssh/config";
  };
}
