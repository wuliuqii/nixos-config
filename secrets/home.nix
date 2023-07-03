{ ... }:
{
  home.file = {
    "id_ed25519.pub" = {
      source = ./id_ed25519.pub;
      target = ".ssh/id_ed25519.pub";
    };
  };
}
