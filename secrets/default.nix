{ user, ... }:
{
  sops.secrets.id_ed22519 = {
    format = "binary";
    sopsFile = ./id_ed25519;
    owner = "${user}";
    path = "/home/${user}/.ssh/id_ed25519";
  };
}
