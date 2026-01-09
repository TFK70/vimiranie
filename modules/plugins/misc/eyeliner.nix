{
  flake.modules.nixvim.eyeliner = {
    plugins = {
      eyeliner = {
        enable = true;
        settings = {
          highlight_on_key = true;
          dim = false;
        };
      };
    };
  };
}
