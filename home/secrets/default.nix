{ config, ... }:
let
  user = "${config.profile.userName}";
  home = "/home/${user}";
in
{
  home.file = {
    "id_ed25519.pub" = {
      source = ./id_ed25519.pub;
      target = ".ssh/id_ed25519.pub";
    };
  };

  sops = {
    age.keyFile = "/home/${config.profile.userName}/.config/sops/age/keys.txt";
    defaultSopsFile = ./secrets.yaml;

    secrets = {
      id_ed22519 = {
        format = "binary";
        sopsFile = ./id_ed25519;
        path = "${home}/.ssh/id_ed25519";
      };

      ssh-config = {
        format = "binary";
        sopsFile = ./ssh_config;
        path = "${home}/.ssh/config";
      };

      github-copilot = {
        format = "binary";
        sopsFile = ./copilot;
        path = "${home}/.config/github-copilot/hosts.json";
      };
    };
  };
}
