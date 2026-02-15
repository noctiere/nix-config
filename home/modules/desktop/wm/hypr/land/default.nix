{
  config,
  osConfig,
  lib,
  ...
}: let
  osCfg = osConfig.modules.desktop.wm.hypr;
  cfg = config.hmModules.desktop.wm.hypr.land;
in {
  imports = [
    ./autostart.nix
    ./binds.nix
    ./env.nix
    ./input.nix
    ./monitors.nix
    ./workspace.nix
    ./decoration.nix
  ];

  options.hmModules.desktop.wm.hypr.land.enable = lib.mkEnableOption "Whether to enable hyprland home-manager module";

  config = lib.mkIf (osCfg.enable && cfg.enable) {
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
