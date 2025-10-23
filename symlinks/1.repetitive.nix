{
  config,
  symlinkRoot,
  ...
}: {
  xdg.configFile = {
    "copyq/copyq.conf".source = config.lib.file.mkOutOfStoreSymlink "${symlinkRoot}/copyq/copyq.conf";
    "shellcheckrc".source = config.lib.file.mkOutOfStoreSymlink "${symlinkRoot}/shellcheckrc";
    "spaceship.zsh".source = config.lib.file.mkOutOfStoreSymlink "${symlinkRoot}/spaceship.zsh";

    "eww" = {
      source = config.lib.file.mkOutOfStoreSymlink "${symlinkRoot}/eww";
      recursive = true;
    };
    "fish" = {
      source = config.lib.file.mkOutOfStoreSymlink "${symlinkRoot}/fish";
      recursive = true;
    };
    "nushell" = {
      source = config.lib.file.mkOutOfStoreSymlink "${symlinkRoot}/nushell";
      recursive = true;
    };
    "nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${symlinkRoot}/nvim";
      recursive = true;
    };
    "tmux" = {
      source = config.lib.file.mkOutOfStoreSymlink "${symlinkRoot}/tmux";
      recursive = true;
    };
    "waybar" = {
      source = config.lib.file.mkOutOfStoreSymlink "${symlinkRoot}/waybar";
      recursive = true;
    };
  };
}
