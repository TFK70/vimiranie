{
  flake.modules.nixvim.transparent = { pkgs, ... }: {
    plugins = {
      transparent = {
        enable = true;
        package = pkgs.vimPlugins.transparent-nvim.overrideAttrs (old: {
          meta = old.meta // {
            # какого-то хуя она unfree стала
            license = pkgs.lib.licenses.mit;
          };
        });
        settings = {
          exclude_groups = [
            "CursorLine"
          ];
          extra_groups = [
            "NormalSB"
            "SignColumn"
            "NormalNC"
            "VertSplit"
            "NvimTreeWinSeparator"
            "TelescopeBorder"
            "TelescopeNormal"
            "TelescopePromptBorder"
            "TelescopePromptTitle"
            "NvimTreeNormal"
            "NvimTreeNormalNC"
            "EndOfBuffer"
            "MsgArea"
            "NotifyBackground"
            "NotifyERRORBorder"
            "NotifyINFOBorder"
            "NotifyWARNBorder"
            "NotifyTRACEBorder"
            "NotifyERRORBody"
            "NotifyINFOBody"
            "NotifyWARNBody"
            "NotifyTRACEBody"
            "LazyNormal"
            "FloatBorder"
            "FloatTitle"
            "NormalFloat"
            "CmpDocumentation"
            "Pmenu"
            "RenderMarkdownH1Bg"
            "RenderMarkdownH2Bg"
            "RenderMarkdownH3Bg"
            "RenderMarkdownH4Bg"
            "RenderMarkdownH5Bg"
            "RenderMarkdownH6Bg"
            "AvanteSidebarNormal"
            "AvanteSidebarWinSeparator"
            "WhichKeyNormal"
          ];
        };
      };
    };
  };
}
