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
    version = "e3912a4b3ac2c202d89face3fef3d41eb1d7fcd6";
    src = fetchFromGitHub {
      owner = "hchunhui";
      repo = "librime-lua";
      rev = "e3912a4b3ac2c202d89face3fef3d41eb1d7fcd6";
      fetchSubmodules = false;
      sha256 = "sha256-zx0F41szn5qlc2MNjt1vizLIsIFQ67fp5cb8U8UUgtY=";
    };
    date = "2024-12-21";
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
    version = "22699f5ade55cf27b33417e7e53346218e8c83e4";
    src = fetchFromGitHub {
      owner = "iDvel";
      repo = "rime-ice";
      rev = "22699f5ade55cf27b33417e7e53346218e8c83e4";
      fetchSubmodules = false;
      sha256 = "sha256-TXe5dScOsyqMwKg03CDmhiSWLHV0QOKOyZGvfG4LFzY=";
    };
    date = "2025-03-07";
  };
  wallpaper = {
    pname = "wallpaper";
    version = "4e74d42ab8ac6bc845f0c40416343d70c52a72bb";
    src = fetchFromGitHub {
      owner = "wuliuqii";
      repo = "wallpaper";
      rev = "4e74d42ab8ac6bc845f0c40416343d70c52a72bb";
      fetchSubmodules = false;
      sha256 = "sha256-HFAG0kFI6QbaA7qn4PRcDs6gu6LhPw1cXwGgsdRUGsY=";
    };
    date = "2024-12-12";
  };
}
