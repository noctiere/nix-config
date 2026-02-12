{
  config,
  osConfig,
  lib,
  ...
}: let
  cfg = osConfig.modules.wm;
in {
  config =
    lib.mkIf (cfg.enable && cfg.mangowc.enable) {
      programs.waybar.enable = true;
      home.file.".config/waybar".source = config.lib.file.mkOutOfStoreSymlink ./waybar;
      home.file.".config/mango".source = config.lib.file.mkOutOfStoreSymlink ./mango;
    };
}
