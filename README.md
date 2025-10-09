Material for the "Validating Custom Keyboard Layouts on NixOS" blog [post](https://blog.daniel-beskin.com/2025-10-04-validating-custom-keyboard-layouts-on-nixos).

Build the different files with the following command (modify the filename accordingly):
```console
nix build --impure --expr 'let pkgs = import <nixpkgs> {}; in (import ./with-validation3.nix { inherit pkgs; }).services.xserver.xkb.extraLayouts'
```
