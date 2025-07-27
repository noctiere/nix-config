{
  inputs,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  cfg = osConfig.windowManager;
in {
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];

  config = lib.mkIf (cfg.enable && cfg.plasma.enable) {
    home.packages = [pkgs.kdePackages.krohnkite]; # Dynamic Tiling Extension for KWin 6
    programs.plasma = {
      enable = true;
    };
  };
}
