{myvars, ...}: {
  networking = {
    inherit (myvars) hostName;
    networkmanager.enable = true;
  };

  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };
}
