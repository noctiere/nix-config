{
  inputs,
  config,
  osConfig,
  lib,
  pkgs,
  ...
}: let
  osCfg = osConfig.modules.gui.wm.hypr;
in {
  imports = [inputs.noctalia.homeModules.default];

  config = lib.mkIf osCfg.enable {
    stylix.targets.noctalia-shell.enable = false;

    programs.noctalia-shell.enable = true;

    home.packages = with pkgs; [
      gpu-screen-recorder
    ];

    home.file.".config/noctalia".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/noctalia";
  };
}
