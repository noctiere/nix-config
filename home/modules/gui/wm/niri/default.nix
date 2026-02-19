{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  osCfg = osConfig.modules.gui.wm.niri;
in {
  config = lib.mkIf osCfg.enable {
    home.packages = with pkgs; [
      xwayland-satellite
    ];

    home.file.".config/niri".source = config.lib.file.mkOutOfStoreSymlink ./config;
  };
}
