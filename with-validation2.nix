{
  pkgs,
  lib ? pkgs.lib,
  ...
}: let
  buildLayout = {
    name,
    description,
    lang,
    symbols,
  }: let
    xkbcomp = lib.getExe pkgs.xorg.xkbcomp;
    compilationOutputFile = pkgs.runCommand "${name}-compiled-keyboard-layout" {} ''
      (${xkbcomp} ${symbols} 2> $out) || true
    '';
    compilationOutput = builtins.readFile compilationOutputFile;
    compilationSuccess = compilationOutput == "";
  in {
    ${name} =
      if compilationSuccess
      then {
        description = description;
        languages = [lang];
        symbolsFile = symbols;
      }
      else abort "Failure compiling layout [${name}]: ${compilationOutput}";
  };
in {
  services.xserver.xkb.extraLayouts = buildLayout {
    name = "test";
    description = "Test";
    lang = "eng";
    symbols = ./test.xkb;
  };
}
