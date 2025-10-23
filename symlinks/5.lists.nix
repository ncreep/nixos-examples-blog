{
  config,
  symlinkRoot,
  lib,
  ...
}: let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (lib) map mergeAttrsList;

  toSrcFile = name: "${symlinkRoot}/${name}";
  link = name: mkOutOfStoreSymlink (toSrcFile name);

  linkFile = name: {${name}.source = link name;};
  linkDir = name: {
    ${name} = {
      source = link name;
      recursive = true;
    };
  };

  confFiles = map linkFile [
    "copyq/copyq.conf"
    "shellcheckrc"
    "spaceship.zsh"
  ];

  confDirs = map linkDir [
    "eww"
    "fish"
    "nushell"
    "nvim"
    "tmux"
    "waybar"
  ];

  links = mergeAttrsList (confFiles ++ confDirs);
in {
  xdg.configFile = links;
}
