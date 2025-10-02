{
  osConfig,
  lib,
  ...
}: let
  cfg = osConfig.windowManager;
in {
  imports = [
    ./config
    ./waybar.nix
    ./apps.nix
    ./hyprsunset.nix
  ];

  config = lib.mkIf (cfg.enable && cfg.hyprland.enable) {
    wayland.windowManager.hyprland = {
      enable = true;
      # set the Hyprland and XDPH packages to null to use the ones from the NixOS module
      package = null;
      portalPackage = null;
      systemd.variables = ["--all"];
      systemd.enable = false;
    };

    programs.hyprlock.enable = true;
  };
}
