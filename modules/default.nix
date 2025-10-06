{
  imports = [
    ./desktop
    ./styles
    ./shell.nix
    ./locale.nix
    ./openssh.nix
    ./nh.nix
    ./cache.nix
  ];

  windowManager = {
    enable = true;
    hyprland.enable = true;
    gnome.enable = false;
    cosmic.enable = false;
    plasma.enable = false;
  };
}
