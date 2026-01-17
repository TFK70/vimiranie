{ inputs, ... }:
{
  flake.modules.nixvim.keymap = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    keymaps = [
      # Keep visual selection after indenting
      {
        action = "<gv";
        key = "<";
        mode = "v";
      }
      {
        action = ">gv";
        key = ">";
        mode = "v";
      }

      # Dragging
      {
        action = ":m '>+1<CR>gv=gv";
        key = "J";
        mode = "v";
      }
      {
        action = ":m '<-2<CR>gv=gv";
        key = "K";
        mode = "v";
      }

      # Keep cursor in the middle
      {
        action = "<C-d>zz";
        key = "<C-d>";
        mode = "n";
      }
      {
        action = "<C-u>zz";
        key = "<C-u>";
        mode = "n";
      }
      {
        action = "nzzzv";
        key = "n";
        mode = "n";
      }
      {
        action = "Nzzzv";
        key = "N";
        mode = "n";
      }

      # Replace under the cursor
      {
        action = "y:%s/<C-r>\"//g<Left><Left>";
        key = "<leader>sr";
        mode = "v";
      }

      {
        action = "<cmd>nohlsearch<CR>";
        key = "<leader>h";
        mode = "n";
      }

      # Open diagnostic quickfix list
      {
        action = "<cmd>lua vim.diagnostic.setloclist()<cr>";
        key = "<leader>q";
        mode = "n";
        options = { desc = "Open diagnostic [Q]uickfix list"; };
      }

      # Exit terminal mode
      {
        action = "<C-\\><C-n>";
        key = "<Esc><Esc>";
        mode = "t";
        options = { desc = "Exit terminal mode"; };
      }

      # Unbind arrow keys
      {
        action = "<cmd>echo \"Use h to move!!\"<CR>";
        key = "<left>";
        mode = "n";
      }
      {
        action = "<cmd>echo \"Use l to move!!\"<CR>";
        key = "<right>";
        mode = "n";
      }
      {
        action = "<cmd>echo \"Use k to move!!\"<CR>";
        key = "<up>";
        mode = "n";
      }
      {
        action = "<cmd>echo \"Use j to move!!\"<CR>";
        key = "<down>";
        mode = "n";
      }

      # Move focus
      {
        action = "<C-w><C-h>";
        key = "<C-h>";
        mode = "n";
        options = { desc = "Move focus to the left window"; };
      }
      {
        action = "<C-w><C-l>";
        key = "<C-l>";
        mode = "n";
        options = { desc = "Move focus to the right window"; };
      }
      {
        action = "<C-w><C-j>";
        key = "<C-j>";
        mode = "n";
        options = { desc = "Move focus to the lower window"; };
      }
      {
        action = "<C-w><C-k>";
        key = "<C-k>";
        mode = "n";
        options = { desc = "Move focus to the upper window"; };
      }

      # Null buffer
      {
        action = "\"_dP";
        key = "<leader>p";
        mode = "x";
      }

      # Obsidian
      {
        action = "obs_utils.approve";
        key = "<leader>ora";
        mode = "n";
        options = { desc = "[O]bsidian [R]eview [A]pprove"; };
      }
      {
        action = "obs_utils.discard";
        key = "<leader>ord";
        mode = "n";
        options = { desc = "[O]bsidian [R]eview [D]iscard"; };
      }
      {
        action = "obs_utils.commit";
        key = "<leader>ovc";
        mode = "n";
        options = { desc = "[O]bsidian [V]ault [C]ommit"; };
      }

      # Fun shit
      {
        action = "<cmd>CellularAutomaton make_it_rain<CR>";
        key = "<leader><leader><leader>";
        mode = "n";
      }
    ];
  };
}
