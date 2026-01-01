{
  flake.modules.nixvim.opts = {
    globals = {
      have_nerd_font = true;
    };

    opts = {
      conceallevel = 0; # so that `` is visible in markdown files
      wrap = false; # display lines as one long line
      signcolumn = "yes"; # always show the sign column, otherwise it would shift the text each time
      showcmd = false;
      ruler = false;
      fillchars = {
        eob = " ";
      }; # Remove tildas
      termguicolors = true; # enable 24-bit colour
      titlelen = 0; # do not shorten title
      number = true;
      relativenumber = true;
      mouse = "a"; # Enable mouse
      showmode = false; # Don't show the mode, since it's already in the status line
      clipboard = "unnamedplus"; # Sync clipboard between OS and Neovim.
      breakindent = true; # Enable break indent
      undofile = true; # Save undo history

      # Case-insensitive searching UNLESS \C or one or more capital letters in the search term
      ignorecase = true;
      smartcase = true;

      updatetime = 250; # Decrease update time
      timeoutlen = 300; # Decrease mapped sequence wait time

      smartindent = true; # make indenting smarter again
      splitbelow = true; # force all horizontal splits to go below current window
      splitright = true; # force all vertical splits to go to the right of current window

      # Sets how neovim will display certain whitespace characters in the editor.
      list = true;
      listchars = {
        tab = "▏ ";
        trail = "·";
        nbsp = "␣";
      };

      inccommand = "split"; # Preview substitutions live, as you type!
      cursorline = true; # Show which line your cursor is on
      expandtab = true; # convert tabs to spaces
      shiftwidth = 2; # the number of spaces inserted for each indentation
      tabstop = 2; # insert 2 spaces for a tab
      scrolloff = 8; # Minimal number of screen lines to keep above and below the cursor.
      swapfile = false; # creates a swapfile
    };
  };
}
