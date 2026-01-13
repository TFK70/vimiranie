{
  flake.modules.nixvim.bufdelete = {
    plugins = {
      bufdelete = {
        enable = true;
      };
    };

    # local opts = { noremap = true, silent = true }
    # keymap("n", "Q", ":lua require('bufdelete').bufdelete(0, false)<cr>", opts)
    keymaps = [
      {
        action = ":lua require('bufdelete').bufdelete(0, false)<cr>";
        key = "<leader>p";
        mode = "x";
        options = {
          noremap = true;
          silent = true;
          desc = "Delete buffer";
        };
      }
    ];
  };
}
