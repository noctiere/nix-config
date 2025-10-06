{lib, ...}: {
  imports = [
    ./hyprland.nix
    ./gnome.nix
    ./cosmic.nix
    ./plasma.nix
  ];

  options.modules.wm.enable = lib.mkEnableOption "Enable Window Manager";
}
