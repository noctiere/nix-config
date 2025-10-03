{config, ...}: {
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
}
