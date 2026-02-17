{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  osCfg = osConfig.modules.gui.wm.niri;
  cfg = config.hmModules.gui.wm.niri;
in {
  options.hmModules.gui.wm.niri.enable = lib.mkEnableOption "Whether to enable niri home-manager module";

  config = lib.mkIf (osCfg.enable && cfg.enable) {
    home.packages = with pkgs; [
      xwayland-satellite
    ];

    home.file.".config/niri".source = config.lib.file.mkOutOfStoreSymlink ./config;
  };
}
