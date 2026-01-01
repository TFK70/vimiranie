{
  flake.modules.nixvim.notify = {
    plugins = {
      notify = {
        enable = true;
        settings = {
          timeout = 4000;
          stages = "static";
        };
      };
    };
  };
}
