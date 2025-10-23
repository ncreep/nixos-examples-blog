{filePath}: let
  pkgs = import <nixpkgs> {};
  lib = pkgs.lib;

  mkOutOfStoreSymlink = path: {
    outOfStoreLink = path;
  };

  config = {
    lib.file = {
      inherit mkOutOfStoreSymlink;
    };
  };

  symlinkRoot = "/home/danile/nixos-config";

  result = import filePath {
    inherit config lib symlinkRoot;
  };
in
  result.xdg.configFile
