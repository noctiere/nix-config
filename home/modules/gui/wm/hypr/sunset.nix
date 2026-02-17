{
  config,
  osConfig,
  lib,
  ...
}: let
  osCfg = osConfig.modules.gui.wm.hypr;
  cfg = config.hmModules.gui.wm.hypr;
in {
  options.hmModules.gui.wm.hypr.sunset.enable = lib.mkEnableOption "Whether to enable hyprsunset home-manager module";

  config = lib.mkIf (osCfg.enable && cfg.enable && cfg.sunset.enable) {
    services.hyprsunset = {
      enable = true;
      settings = {
        profile = [
          {
            time = "6:00";
            temperature = 6500;
            identity = true;
          }
          {
            time = "20:00";
            temperature = 4000;
          }
        ];
      };
    };
  };
}
