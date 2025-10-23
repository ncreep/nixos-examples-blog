{
  config,
  symlinkRoot,
  ...
}: let
  inherit (config.lib.file) mkOutOfStoreSymlink;

  toSrcFile = name: "${symlinkRoot}/${name}";
  link = name: mkOutOfStoreSymlink (toSrcFile name);
in {
  xdg.configFile = {
    "copyq/copyq.conf".source = link "copyq/copyq.conf";
    "shellcheckrc".source = link "shellcheckrc";
    "spaceship.zsh".source = link "spaceship.zsh";

    "eww" = {
      source = link "eww";
      recursive = true;
    };
    "fish" = {
      source = link "fish";
      recursive = true;
    };
    "nushell" = {
      source = link "nushell";
      recursive = true;
    };
    "nvim" = {
      source = link "nvim";
      recursive = true;
    };
    "tmux" = {
      source = link "tmux";
      recursive = true;
    };
    "waybar" = {
      source = link "waybar";
      recursive = true;
    };
  };
}
