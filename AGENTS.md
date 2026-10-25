# Vimiranie

Global Neovim configuration built as a [nixvim](https://github.com/nix-community/nixvim) flake.

## Structure

- `flake.nix` — minimal entry point; outputs are assembled by `flake-parts` + `import-tree` from `modules/`.
- `modules/flake/` — flake-level wiring: `imports.nix` (flake-parts + nixvim flakeModules), `systems.nix` (systems from `nix-systems`).
- `modules/nixvim.nix` — defines `flake.nixvimModules.default` (collects `config.flake.modules.nixvim`) and perSystem packages:
  - `packages.default` — base nixvim (`makeNixvimWithModule`).
  - `packages.lsp` — same nixvim extended with `vimiranie.settings.lsp.enable = true`.
- `modules/home-manager.nix` — `flake.homeManagerModules.default`; exposes `programs.vimiranie` with options (`enable`, `package`, `packageWithLsps`, `settings.*` for stylix/colorschemes/obsidian/supermaven).
- `modules/options.nix` — custom option definitions (e.g. `vimiranie.settings.lsp.enable`).
- `modules/config/` — plain Neovim config (opts, keymaps, autocmds, filetypes).
- `modules/plugins/` — plugin modules grouped by category (`core/`, `appearance/`, `misc/`, etc.; LSP in `core/lsp.nix`).

## Conventions

- Feature toggles go through `vimiranie.settings.<feature>.enable`; LSP is **off** in `packages.default` and **on** in `packages.lsp` (and in the home-manager `packageWithLsps`).
- Stylix integration is optional: when enabled, the package is extended with `config.stylix.targets.nixvim.exportedModule` (see `modules/home-manager.nix`).
- Pinned to nixpkgs/nixvim branches `nixos-26.05` — keep both in sync.

## Build / check

- `nix build .#default` — base package
- `nix build .#lsp` — package with LSP enabled
- Do not run `nix flake update` or modify `flake.lock` unless asked.
