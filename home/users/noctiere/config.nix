{mylib, ...}: {
  imports = map mylib.relativeToRoot [
    "home/base"
    "home/modules"
  ];

  hmModules = {
    gui = {
      browsers.firefox.enable = true;
      editors = {
        zed-editor = {
          enable = true;
        };
      };
      terminal.wezterm.enable = true;
      media.enable = true;
      obs.enable = true;
      # spicetify.enable = true;
    };
    tui = {
      spotifyd.enable = true;
    };
    theme = {
      stylix = {
        enable = true;
        polarity = "dark";
        colorScheme = "kanagawa-dragon";
        image = ./Wallpapers/bay.jpg;
      };
    };
  };
}
