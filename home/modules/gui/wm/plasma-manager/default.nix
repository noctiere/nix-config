{
  osConfig,
  inputs,
  lib,
  pkgs,
  ...
}: let
  osCfg = osConfig.modules.gui.wm.plasma;
in {
  imports = [
    inputs.plasma-manager.homeModules.plasma-manager
  ];

  config = lib.mkIf osCfg.enable {
    home.packages = [pkgs.kdePackages.krohnkite]; # Dynamic Tiling Extension for KWin 6
    programs.plasma = {
      enable = true;
    };
  };
}
