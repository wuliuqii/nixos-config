# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  bibata-hyprcursor = {
    pname = "bibata-hyprcursor";
    version = "35ccfe209a808e40d6c2ca60a46cbe4faf68b690";
    src = fetchFromGitHub {
      owner = "ful1e5";
      repo = "Bibata_Cursor";
      rev = "35ccfe209a808e40d6c2ca60a46cbe4faf68b690";
      fetchSubmodules = false;
      sha256 = "sha256-kIKidw1vditpuxO1gVuZeUPdWBzkiksO/q2R/+DUdEc=";
    };
    date = "2024-06-18";
  };
  librime-charcode = {
    pname = "librime-charcode";
    version = "55e7f563e999802d41a13ba02657c1be4b2011b4";
    src = fetchFromGitHub {
      owner = "rime";
      repo = "librime-charcode";
      rev = "55e7f563e999802d41a13ba02657c1be4b2011b4";
      fetchSubmodules = false;
      sha256 = "sha256-KfKkpph+2ChQpkkGKubmpg/18uPX9qUHTqJT1PSGorI=";
    };
    date = "2024-03-19";
  };
  librime-lua = {
    pname = "librime-lua";
    version = "b210d0cfbd2a3cc6edd4709dd0a92c479bfca10b";
    src = fetchFromGitHub {
      owner = "hchunhui";
      repo = "librime-lua";
      rev = "b210d0cfbd2a3cc6edd4709dd0a92c479bfca10b";
      fetchSubmodules = false;
      sha256 = "sha256-ETjLN40G4I0FEsQgNY8JM4AInqyb3yJwEJTGqdIHGWg=";
    };
    date = "2024-11-02";
  };
  librime-proto = {
    pname = "librime-proto";
    version = "657a923cd4c333e681dc943e6894e6f6d42d25b4";
    src = fetchFromGitHub {
      owner = "lotem";
      repo = "librime-proto";
      rev = "657a923cd4c333e681dc943e6894e6f6d42d25b4";
      fetchSubmodules = false;
      sha256 = "sha256-HdypebfmzreSdEQBwbvRG6sJZPASP+e8Tew+GrMnpOQ=";
    };
    date = "2023-10-17";
  };
  rime-ice = {
    pname = "rime-ice";
    version = "66575014ac063a8067a773ccc50952491bd432e9";
    src = fetchFromGitHub {
      owner = "iDvel";
      repo = "rime-ice";
      rev = "66575014ac063a8067a773ccc50952491bd432e9";
      fetchSubmodules = false;
      sha256 = "sha256-UnIz10ofLIPZo2moG1tzJaoPK5hKEjLO11nyhjzL2Qo=";
    };
    date = "2024-11-29";
  };
  wallpaper = {
    pname = "wallpaper";
    version = "6cc862c1d5e8bcd455179f20d32b6373a42c92ea";
    src = fetchFromGitHub {
      owner = "wuliuqii";
      repo = "wallpaper";
      rev = "6cc862c1d5e8bcd455179f20d32b6373a42c92ea";
      fetchSubmodules = false;
      sha256 = "sha256-D2ElvYY3DvLUxZeKBE+ks6OpMyhrUfNepQzcQQPnSGo=";
    };
    date = "2024-08-17";
  };
}
