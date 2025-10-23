{
  config,
  symlinkRoot,
  ...
}: let
  inherit (config.lib.file) mkOutOfStoreSymlink;

  toSrcFile = name: "${symlinkRoot}/${name}";
  link = name: mkOutOfStoreSymlink (toSrcFile name);

  linkFile = name: {${name}.source = link name;};
  linkDir = name: {
    ${name} = {
      source = link name;
      recursive = true;
    };
  };

  confFiles =
    (linkFile "copyq/copyq.conf")
    // (linkFile "shellcheckrc")
    // (linkFile "spaceship.zsh");

  confDirs =
    (linkDir "eww")
    // (linkDir "fish")
    // (linkDir "nushell")
    // (linkDir "nvim")
    // (linkDir "tmux")
    // (linkDir "waybar");

  links = confFiles // confDirs;
in {
  xdg.configFile = links;
}
