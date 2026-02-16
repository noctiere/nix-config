{
  myvars,
  pkgs,
  ...
}: {
  networking = {
    inherit (myvars) hostName;
    networkmanager.enable = true;
  };

  environment.systemPackages = with pkgs; [
    impala
  ];

  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };
}
