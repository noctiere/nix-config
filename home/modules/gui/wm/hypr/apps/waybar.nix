{
  config,
  osConfig,
  lib,
  ...
}: let
  osCfg = osConfig.modules.gui.wm.hypr;
  cfg = config.hmModules.gui.wm.hypr;
in {
  config = lib.mkIf (osCfg.enable && cfg.enable) {
    programs.waybar.enable = true;
    home.file.".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/waybar";
  };
}
