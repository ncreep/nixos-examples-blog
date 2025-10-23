Material for the "Pretty Symlinking with Home Manager" blog [post](https://blog.daniel-beskin.com/2025-10-18-symlinking-home-manager).

Test the files with the following command (change the filename as appropriate):

```bash
nix eval --impure --expr "import ./test.nix { filePath = \"$(realpath ./6.final.nix)\"; }" | nixfmt
```
