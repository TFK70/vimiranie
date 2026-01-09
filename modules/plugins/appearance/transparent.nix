{
  flake.modules.nixvim.transparent = {
    plugins = {
      transparent = {
        enable = true;
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
