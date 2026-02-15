{
  config,
  osConfig,
  pkgs,
  lib,
  ...
}: let
  osCfg = osConfig.modules.desktop.wm.gnome;
  cfg = config.hmModules.desktop.wm.gnome;
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
