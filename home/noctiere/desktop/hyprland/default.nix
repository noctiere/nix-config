{
  config,
  osConfig,
  lib,
  ...
}: let
  osCfg = osConfig.modules.wm;
  cfg = config.hmModules.wm.hypr.land;
in {
  imports = [
    ./config
    ./waybar.nix
    ./apps.nix
    ./hyprsunset.nix
  ];

  options.hmModules.wm.hypr.land.enable = lib.mkEnableOption "Whether to enable hyprland home-manager module";

  config = lib.mkIf (osCfg.enable && osCfg.hyprland.enable && cfg.enable) {
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
