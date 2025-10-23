{
  config,
  symlinkRoot,
  ...
}: let
  link = config.lib.file.mkOutOfStoreSymlink;
in {
  xdg.configFile = {
    "copyq/copyq.conf".source = link "${symlinkRoot}/copyq/copyq.conf";
    "shellcheckrc".source = link "${symlinkRoot}/shellcheckrc";
    "spaceship.zsh".source = link "${symlinkRoot}/spaceship.zsh";

    "eww" = {
      source = link "${symlinkRoot}/eww";
      recursive = true;
    };
    "fish" = {
      source = link "${symlinkRoot}/fish";
      recursive = true;
    };
    "nushell" = {
      source = link "${symlinkRoot}/nushell";
      recursive = true;
    };
    "nvim" = {
      source = link "${symlinkRoot}/nvim";
      recursive = true;
    };
    "tmux" = {
      source = link "${symlinkRoot}/tmux";
      recursive = true;
    };
    "waybar" = {
      source = link "${symlinkRoot}/waybar";
      recursive = true;
    };
  };
}
