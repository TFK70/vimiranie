{ inputs, ... }:
{
  flake.modules.nixvim.lsp = {
    lsp = {
      inlayHints.enable = true;

      servers = {
        "*" = {
          config = {
            capabilities = {
              textDocument = {
                semanticTokens = {
                  multilineTokenSupport = true;
                };
              };
            };
            root_markers = [
              ".git"
            ];
          };
        };

        bashls.enable = true;
        biome = {
          enable = true;
          config.filetypes = [
            "javascript"
            "javascriptreact"
            "typescript"
            "typescriptreact"
            "json"
            "jsonc"
            "css"
            "html"
          ];
        };
        cmake.enable = true;
        cssls.enable = true;
        dockerls.enable = true;
        lua_ls.enable = true;
        gopls.enable = true;
        html.enable = true;
        java_language_server.enable = true;
        jsonls.enable = true;
        marksman.enable = true;
        pyright.enable = true;
        pylsp.enable = true;
        basedpyright.enable = true;
        qmlls.enable = true;
        sqls.enable = true;
        ts_ls.enable = true;
        tsgo.enable = true;
        yamlls.enable = true;
        zls.enable = true;
      };

    };

    keymapsOnEvents.LspAttach = [
      {
        action.__raw = ''vim.lsp.buf.format'';
        mode = "v";
        key = "<leader>lf";
        options = {
          silent = true;
          buffer = false;
          desc = "Format selection";
        };
      }
      {
        key = "<leader>lH";
        mode = "n";
        action = inputs.nixvim.lib.nixvim.mkRaw "vim.diagnostic.open_float";
        options = {
          silent = true;
          desc = "Lsp diagnostic open_float";
        };
      }

      {
        action = "<CMD>PeekDefinition textDocument/definition<CR>";
        mode = "n";
        key = "<leader>lp";
        options = {
          desc = "Preview definition";
        };
      }
      {
        action = "<CMD>PeekDefinition textDocument/typeDefinition<CR>";
        mode = "n";
        key = "<leader>lP";
        options = {
          desc = "Preview type definition";
        };
      }

      {
        key = "<leader>lf";
        mode = "n";
        action = inputs.nixvim.lib.nixvim.mkRaw "vim.lsp.buf.format";
        options = {
          silent = true;
          desc = "Lsp buf format";
        };
      }

      {
        key = "<leader>la";
        mode = "n";
        action = inputs.nixvim.lib.nixvim.mkRaw "vim.lsp.buf.code_action";
        options = {
          silent = true;
          desc = "Lsp buf code_action";
        };
      }

      {
        key = "<leader>ld";
        mode = "n";
        action = inputs.nixvim.lib.nixvim.mkRaw "vim.lsp.buf.definition";
        options = {
          silent = true;
          desc = "Lsp buf definition";
        };
      }
      {
        key = "<leader>lt";
        mode = "n";
        action = inputs.nixvim.lib.nixvim.mkRaw "vim.lsp.buf.type_definition";
        options = {
          silent = true;
          desc = "Lsp buf type_definition";
        };
      }
      {
        key = "<leader>lr";
        mode = "n";
        action = inputs.nixvim.lib.nixvim.mkRaw "vim.lsp.buf.rename";
        options = {
          silent = true;
          desc = "Lsp rename";
        };
      }
      {
        key = "K";
        mode = "n";
        action = inputs.nixvim.lib.nixvim.mkRaw "vim.lsp.buf.hover";
        options = {
          silent = true;
          desc = "Lsp hover";
        };
      }
      {
        key = "<C-h>";
        mode = "i";
        action = inputs.nixvim.lib.nixvim.mkRaw "vim.lsp.buf.signature_help";
        options = {
          silent = true;
          desc = "Signarure help";
        };
      }
    ];

    plugins = {
      lsp.enable = true;
      lsp-format.enable = true;
      lsp-signature.enable = true;
      schemastore.enable = true;
    };
  };
}
