{ inputs, ... }:
{
  flake.modules.nixvim.autocmd = {
    autoGroups = {
      highlight-yank = {
        clear = true;
      };
    };

    autoCmd = [
      {
        event = [ "TextYankPost" ];
        desc = "Highlight when yanking (copying) text";
        group = "highlight-yank";
        callback = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            vim.highlight.on_yank()
          end
        '';
      }
      {
        event = [ "FileType" ];
        pattern = [
          "netrw"
          "Jaq"
          "qf"
          "git"
          "help"
          "man"
          "lspinfo"
          "oil"
          "spectre_panel"
          "lir"
          "DressingSelect"
          "tsplayground"
          "query"
          ""
        ];
        callback = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            vim.cmd [[
              nnoremap <silent> <buffer> q :close<CR>
              set nobuflisted
            ]]
          end
        '';
      }
      {
        event = [ "VimResized" ];
        callback = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            vim.cmd "tabdo wincmd ="
          end
        '';
      }
      {
        event = [ "BufWinEnter" ];
        pattern = [ "*" ];
        callback = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            if vim.fn.getcmdwintype() == "" then
              vim.cmd("checktime")
            end
          end
        '';
      }
      {
        event = [ "BufWinEnter" ];
        pattern = [ "*" ];
        callback = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            local dirname = vim.fn.getcwd():match "([^/]+)$"
            vim.opt.titlestring = dirname
          end
        '';
      }
      {
        event = [
          "BufRead"
          "BufNewFile"
        ];
        pattern = [ "*.yaml.gotmpl" ];
        callback = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            vim.bo.filetype = "yaml"
          end
        '';
      }
      {
        event = [ "FileType" ];
        pattern = [
          "gitcommit"
          "markdown"
        ];
        callback = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            vim.opt_local.wrap = true
          end
        '';
      }
      {
        event = [ "Colorscheme" ];
        callback = inputs.nixvim.lib.nixvim.mkRaw ''
          function(e)
            print(e.match)
          end
        '';
      }
    ];
  };
}
