{
  description = "Globalnoe VIMiranie";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
    import-tree.url = "github:vic/import-tree";
    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
    };
    systems = {
      url = "github:nix-systems/default";
    };
  };
  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
