{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  osCfg = osConfig.modules.desktop.wm.niri;
  cfg = config.hmModules.desktop.wm.niri;
in {
  options.hmModules.desktop.wm.niri.enable = lib.mkEnableOption "Whether to enable niri home-manager module";

  config = lib.mkIf (osCfg.enable && cfg.enable) {
    home.packages = with pkgs; [
      xwayland-satellite
    ];

    home.file.".config/niri".source = config.lib.file.mkOutOfStoreSymlink ./config;
  };
}
