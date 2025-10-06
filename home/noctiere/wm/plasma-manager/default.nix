{
  inputs,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  cfg = osConfig.modules.wm;
in {
  imports = [
    inputs.plasma-manager.homeModules.plasma-manager
  ];

  config = lib.mkIf (cfg.enable && cfg.plasma.enable) {
    home.packages = [pkgs.kdePackages.krohnkite]; # Dynamic Tiling Extension for KWin 6
    programs.plasma = {
      enable = true;
    };
  };
}
