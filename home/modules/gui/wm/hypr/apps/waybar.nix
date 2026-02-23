{
  config,
  osConfig,
  lib,
  ...
}: let
  osCfg = osConfig.modules.gui.wm.hypr;
in {
  config = lib.mkIf (osCfg.enable && !config.programs.noctalia-shell.enable) {
    stylix.targets.waybar.enable = false;

    programs.waybar.enable = true;

    home.file.".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/waybar";
  };
}
