{mylib, ...}: {
  imports =
    mylib.scanPaths ./.
    ++ [
      ../modules/base
      ../modules/nixos
    ];
}
