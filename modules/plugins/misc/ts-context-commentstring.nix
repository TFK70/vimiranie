{
  flake.modules.nixvim.ts-context-commentstring = {
    plugins = {
      ts-context-commentstring = {
        enable = true;
        settings = {
          enable_autocmd = false;
        };
      };
    };
  };
}
