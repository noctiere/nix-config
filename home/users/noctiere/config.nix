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
      # spicetify.enable = true;
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
