{
  config,
  osConfig,
  lib,
  pkgs,
  ...
}: let
  osCfg = osConfig.modules.gui.wm.hypr;
in {
  config = lib.mkIf (osCfg.enable && !config.programs.noctalia-shell.enable) {
    services.walker = {
      enable = true;
    };

    home.packages = with pkgs; [
      elephant
    ];
  };
}
