{
  flake.modules.nixvim.supermaven = {
    plugins = {
      supermaven = {
        enable = true;
        settings = {
          keymaps = {
            accept_suggestion = "<A-k>";
            clear_suggestion = "<A-]>";
            accept_word = "<A-j>";
          };
          ignore_filetypes = {
            markdown = true;
          };
        };
      };
    };
  };
}
