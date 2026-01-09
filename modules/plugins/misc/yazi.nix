{
  flake.modules.nixvim.yazi = {
    globals = {
      loaded_netrwPlugin = 1;
    };

    plugins = {
      yazi = {
        enable = true;
        settings = {
          open_for_directories = true;
        };
      };
    };

    keymaps = [
      {
        key = "<leader>-";
        mode = "n";
        action = "<cmd>Yazi<cr>";
        options = {
          desc = "Yazi at the current file";
        };
      }
      {
        key = "<leader>_";
        mode = "n";
        action = "<cmd>Yazi cwd<cr>";
        options = {
          desc = "Yazi in cwd";
        };
      }
    ];
  };
}
