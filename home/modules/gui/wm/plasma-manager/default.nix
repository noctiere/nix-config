{
  config,
  osConfig,
  inputs,
  lib,
  pkgs,
  ...
}: let
  osCfg = osConfig.modules.gui.wm.plasma;
  cfg = config.hmModules.gui.wm.plasma-manager;
in {
  imports = [
    inputs.plasma-manager.homeModules.plasma-manager
  ];

  options.hmModules.gui.wm.plasma-manager.enable = lib.mkEnableOption "Whether to enable KDE Plasma manager home-manager module";

  config = lib.mkIf (osCfg.enable && cfg.enable) {
    home.packages = [pkgs.kdePackages.krohnkite]; # Dynamic Tiling Extension for KWin 6
    programs.plasma = {
      enable = true;
    };
  };
}
