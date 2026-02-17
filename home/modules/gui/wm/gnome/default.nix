{
  config,
  osConfig,
  pkgs,
  lib,
  ...
}: let
  osCfg = osConfig.modules.gui.wm.gnome;
  cfg = config.hmModules.gui.wm.gnome;
in {
  config = lib.mkIf (osCfg.enable && cfg.enable) {
    programs.gnome-shell = {
      enable = true;
      extensions = with pkgs.gnomeExtensions; [
        {
          # package = paperwm;
          package = tiling-shell;
        }
      ];
    };
    # environment.systemPackages = with pkgs; [
    #   gnome-tweaks
    # ];
  };
}
