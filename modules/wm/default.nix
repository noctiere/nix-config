{lib, ...}: {
  imports = [
    ./cosmic.nix
    ./gnome.nix
    ./hyprland.nix
    ./mangowc.nix
    ./niri.nix
    ./plasma.nix
  ];

  options.modules.wm.enable = lib.mkEnableOption "Enable Window Manager";
}
