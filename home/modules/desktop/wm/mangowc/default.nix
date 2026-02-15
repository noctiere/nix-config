{
  config,
  osConfig,
  lib,
  ...
}: let
  osCfg = osConfig.modules.desktop.wm.mangowc;
  cfg = config.hmModules.desktop.wm.mangowc;
in {
  options.hmModules.desktop.wm.mangowc.enable = lib.mkEnableOption "Whether to enable mangowc home-manager module";

  config = lib.mkIf (osCfg.enable && cfg.enable) {
    # programs.waybar.enable = true;
    # home.file.".config/waybar".source = config.lib.file.mkOutOfStoreSymlink ./waybar;
    home.file.".config/mango".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/mango";
  };
}
