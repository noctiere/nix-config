{
  imports = [
    ./desktop
    ./shell.nix
    ./locale.nix
    ./openssh.nix
    ./fonts.nix
    ./nh.nix
    ./stylix.nix
  ];

  windowManager = {
    enable = true;
    hyprland.enable = true;
    gnome.enable = false;
    cosmic.enable = false;
    plasma.enable = false;
  };
}
