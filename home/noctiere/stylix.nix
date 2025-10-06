{
  inputs,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    polarity = "dark";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    # image = ./wallpapers/bay.JPG;
    image = ./wallpapers/foggy_valley_2.png;
    # image = ./wallpapers/gruvbox_image31.png;

    cursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 18;
    };

    iconTheme = {
      enable = true;

      # Rose Pine
      # package = pkgs.rose-pine-icon-theme;
      # light = "rose-pine-dawn";
      # dark = "rose-pine";

      # # Everforest
      package = pkgs.papirus-icon-theme;
      light = "Papirus-Light";
      dark = "Papirus-Dark";

      # Gruvbox
      # package = pkgs.gruvbox-plus-icons;
      # light = "Gruvbox-Plus-Light";
      # dark = "Gruvbox-Plus-Dark";
    };

    targets = {
      waybar.enable = false;
      spicetify.enable = false;
      wezterm.enable = false;
    };
  };
}
