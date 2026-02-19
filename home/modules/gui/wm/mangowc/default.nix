{
  config,
  pkgs,
  osConfig,
  lib,
  ...
}: let
  osCfg = osConfig.modules.gui.wm.mangowc;
in {
  config = lib.mkIf osCfg.enable {
    home.file.".config/mango".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/mango";

    # programs.waybar.enable = true;
    # home.file.".config/waybar".source = config.lib.file.mkOutOfStoreSymlink ./waybar;

    services.walker.enable = true;
    home.packages = with pkgs; [
      elephant
    ];
  };
}
