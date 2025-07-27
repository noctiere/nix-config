{lib, ...}: {
  imports = [
    ./hyprland.nix
    ./gnome.nix
    ./cosmic.nix
    ./plasma.nix
  ];

  options.windowManager.enable = lib.mkEnableOption "Window Manager";
}
