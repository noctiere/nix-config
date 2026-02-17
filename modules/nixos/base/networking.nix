{
  myvars,
  pkgs,
  ...
}: {
  networking = {
    inherit (myvars) hostName;
    wireless.iwd.enable = true;
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };

  environment.systemPackages = with pkgs; [
    impala
  ];

  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };
}
