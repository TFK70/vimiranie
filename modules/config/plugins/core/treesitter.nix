{
  flake.modules.nixvim.treesitter = {
    plugins = {
      treesitter = {
        enable = true;
        lazyLoad.settings.event = [
          "BufReadPost"
          "BufNewFile"
        ];
        folding = true;
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
            "helm"
            "javascript"
            "markdown"
            "markdown_inline"
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
