{
  flake.modules.nixvim.telescope = { lib, ... }: {
    keymaps = [
      {
        key = "<leader>sT";
        mode = "n";
        action = lib.nixvim.mkRaw ''
          function()
            require('telescope.builtin').live_grep({
              search_dirs = { vim.fn.expand("%:h") }
            })
          end
        '';
        options = {
          desc = "Telescope live_grep current dir";
        };
      }
    ];
    plugins = {
      telescope = {
        enable = true;
        autoLoad = true;
        lazyLoad.enable = false;
        keymaps = {
          "<leader>f" = "find_files";
          "<leader>st" = "live_grep";
          "<leader>sb" = "buffers";
          "<leader>sl" = "lsp_document_symbols";
          "<leader>t" = "telescope_sessions";
        };
        extensions = {
          ui-select.enable = true;
          zoxide.enable = true;
          fzf-native = {
            enable = true;
          };
        };
        settings = {
          defaults = {
            file_ignore_patterns = 
              let
                ignore_extensions = [
                  # Images
                  "png"
                  "jpg"
                  "jpeg"

                  # Docs
                  "pdf"
                  "docx"

                  # Executables
                  "exe"
                ];
              in
              [
              "^.git/"
              "^.cache/"
              "^_build/"
              "^dist/"
              "^node_modules/"
              "^.elixir_ls"
            ] ++ map (ext: ".*\.${ext}$") ignore_extensions;
            prompt_prefix = " ";
            color_devicons = true;
            layout_strategy = "vertical";
            sorting_strategy = "ascending";
            layout_config = {
              vertical = {
                prompt_position = "top";
                mirror = false;
                height = 40;
                width = 100;
              };
            };
          };
          pickers = {
            find_files = {
              previewer = false;
              layout_config = {
                vertical = {
                  height = 15;
                };
              };
            };
          };
          planets = {
            show_pluto = true;
            show_moon = true;
          };
          extensions = {
            # fzf = {
            fuzzy = true;
            override_generic_sorter = true;
            override_file_sorter = true;
            case_mode = "smart_case";
            # };
          };
        };
      };
    };
  };
}
