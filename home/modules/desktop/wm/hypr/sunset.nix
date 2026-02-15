{
  config,
  osConfig,
  lib,
  ...
}: let
  osCfg = osConfig.modules.desktop.wm.hypr;
  cfg = config.hmModules.desktop.wm.hypr;
in {
  options.hmModules.wm.hypr.sunset.enable = lib.mkEnableOption "Whether to enable hyprsunset home-manager module";

  config = lib.mkIf (osCfg.enable && cfg.land.enable && cfg.sunset.enable) {
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
