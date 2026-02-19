{
  config,
  lib,
  ...
}: let
  cfg = config.hmModules.gui.terminal.wezterm;
in {
  options.hmModules.gui.terminal.wezterm = {
    enable = lib.mkEnableOption "Whether to enable WezTerm";
  };

  config = lib.mkIf cfg.enable {
    stylix.targets.wezterm.enable = false;

    programs.wezterm = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };

    home = {
      file.".config/wezterm/wezterm.lua".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/wezterm/wezterm.lua";
      sessionVariables = {
        TERMINAL = "wezterm";
      };
    };
  };
}
