{
  flake.modules.nixvim.treesitter =
    { pkgs, ... }:
    {
      extraPackages = [ pkgs.tree-sitter ];
      plugins = {
        treesitter = {
          enable = true;
          nixvimInjections = true;
          settings = {
            ensure_installed = [
              "bash"
              "c"
              "diff"
              "html"
              "lua"
              "luadoc"
              "query"
              "vim"
              "vimdoc"
              "go"
              "gotmpl"
              "zig"
              "helm"
              "javascript"
              "markdown"
              "markdown_inline"
              "latex"
              "bibtex"
              "comment"
            ];
            auto_install = true;
            highlight = {
              enable = true;
            };
            indent = {
              enable = true;
            };
          };
        };

        treesitter-context = {
          enable = true;
          settings = {
            max_lines = 3;
          };
        };
      };
    };
}
