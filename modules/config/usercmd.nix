{ inputs, ... }:
{
  flake.modules.nixvim.usercmd = {
    userCommands = {
      SopsEncrypt = {
        command = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            local buffer = vim.api.nvim_buf_get_name(0)
            vim.cmd("silent !sopse " .. buffer)
          end
        '';
      };
      SopsDecrypt = {
        command = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            local buffer = vim.api.nvim_buf_get_name(0)
            vim.cmd("silent !sopsd " .. buffer)
          end
        '';
      };
      Chmodx = {
        command = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            local buffer = vim.api.nvim_buf_get_name(0)
            vim.cmd("!chmod +x " .. buffer)
          end
        '';
      };
      GenKustomization = {
        command = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            local buffer = vim.api.nvim_buf_get_name(0)
            local dir_path = vim.fn.fnamemodify(buffer, ":h")
            vim.cmd("!gen-kustomization " .. dir_path)
          end
        '';
      };
    };
  };
}
