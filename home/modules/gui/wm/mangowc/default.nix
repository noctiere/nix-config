{
  config,
  pkgs,
  osConfig,
  lib,
  ...
}: let
  osCfg = osConfig.modules.gui.wm.mangowc;
  cfg = config.hmModules.gui.wm.mangowc;
in {
  options.hmModules.gui.wm.mangowc.enable = lib.mkEnableOption "Whether to enable mangowc home-manager module";

  config = lib.mkIf (osCfg.enable && cfg.enable) {
    home.file.".config/mango".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/mango";

    # programs.waybar.enable = true;
    # home.file.".config/waybar".source = config.lib.file.mkOutOfStoreSymlink ./waybar;

    services.walker.enable = true;
    home.packages = with pkgs; [
      elephant
    ];
  };
}
