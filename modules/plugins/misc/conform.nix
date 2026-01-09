{ inputs, ... }:
{
  flake.modules.nixvim.conform =
    { lib, pkgs, ... }:
    {
      plugins = {
        conform-nvim = {
          enable = true;
          settings = {
            notify_on_error = true;

            formatters_by_ft = {
              nix = [ "nixfmt-rfc-style" ];
              lua = [ "stylua" ];
              yaml = [ "yamlfmt" ];
              "_" = [
                "squeeze_blanks"
                "trim_whitespace"
                "trim_newlines"
              ];
            };

            formatters = {
              nixfmt-rfc-style = {
                command = lib.getExe pkgs.nixfmt-rfc-style;
              };
              stylua = {
                command = lib.getExe pkgs.stylua;
              };
              yamlfmt = {
                command = lib.getExe pkgs.yamlfmt;
              };
            };
          };
        };
      };

      keymaps = [
        {
          key = "<leader>=";
          action = inputs.nixvim.lib.nixvim.mkRaw ''
            function()
              require('conform').format({ async = true, lsp_format = 'fallback' })
            end
          '';
          mode = "n";
          options = {
            desc = "Format buffer";
          };
        }
      ];
    };
}
