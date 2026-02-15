{
  pkgs,
  config,
  lib,
  ...
}: let
  nvim = import ../../modules/nvim {inherit pkgs;};
in {
  xdg = {
    configFile.nvim = {
      source = config.lib.file.mkOutOfStoreSymlink ../../modules/nvim;
      recursive = true;
    };

    desktopEntries."nvim" = lib.mkIf pkgs.stdenv.isLinux {
      name = "NeoVim";
      comment = "Edit text files";
      icon = "nvim";
      exec = "xterm -e ${nvim}/bin/nvim %F";
      categories = ["TerminalEmulator"];
      terminal = false;
      mimeType = ["text/plain"];
    };

    desktopEntries."vim" = lib.mkIf pkgs.stdenv.isLinux {
      name = "Vim";
      noDisplay = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.packages = [nvim];
}
