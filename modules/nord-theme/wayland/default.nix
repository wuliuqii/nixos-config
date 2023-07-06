let
  common = import ../common;
in
{
  imports = [
    ./notice
    ./swww
  ] ++ common;
}
