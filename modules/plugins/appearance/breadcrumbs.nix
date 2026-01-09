{
  flake.modules.nixvim.breadcrumbs = { pkgs, ... }: {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "breadcrumbs.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "LunarVim";
          repo = "breadcrumbs.nvim";
          rev = "a59e3ee12818135098e5ce8efeb7b58b675b09ec";
          hash = "sha256-E/EjzeKyPmssDVF0QtbTmLU805F9b+MNl23pIE2ko0o=";
        };
      })
    ];

    extraConfigLua = ''
      require("breadcrumbs").setup()
    '';
  };
}
