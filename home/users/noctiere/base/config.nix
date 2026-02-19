{
  hmModules = {
    gui = {
      browsers.firefox.enable = true;
      editors = {
        zed-editor = {
          enable = true;
        };
      };
      launchers.walker.enable = true;
      terminal.wezterm.enable = true;
      wm = {
        hypr = {
          enable = true;
          # sunset.enable = true;
        };
        # niri.enable = true;
        # mangowc.enable = true;
      };
    };

    theme = {
      stylix = {
        enable = true;
        colorScheme = "kanagawa-dragon";
      };
    };
  };
}
