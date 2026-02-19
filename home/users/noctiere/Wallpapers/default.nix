{config, ...}: {
  home.file."Pictures/Wallpapers".source = config.lib.file.mkOutOfStoreSymlink ../Wallpapers;
}
