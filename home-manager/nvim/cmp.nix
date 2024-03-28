{
  programs.nixvim = {
    plugins = {
      cmp-buffer.enable = true;
      cmp_luasnip.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      cmp-spell.enable = true;
      cmp-treesitter.enable = true;

      cmp = {
        enable = true;
        settings = {
          completion.completeopt = "menu,menuone,noinsert";
          experimental = {
            ghost_text = {
              hl_group = true;
            };
          };
          formatting = {
            fields = ["kind" "abbr" "menu"];
            expandableIndicator = true;
          };

          mapping = {
            "<Tab>" = ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                else
                  fallback()
                end
              end
            '';
            "<S-Tab>" = ''
                   function(fallback)
              	if cmp.visible() then
              		cmp.select_prev_item()
              	elseif luasnip.jumpable(-1) then
              		luasnip.jump(-1)
              	else
              		fallback()
              	end
              end
            '';
            "<C-j>" = "cmp.mapping.select_next_item()";
            "<C-k>" = "cmp.mapping.select_prev_item()";
            "<C-e>" = "cmp.mapping.abort()";
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
          };
          snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          sources = [
            {name = "path";}
            {name = "nvim_lsp";}
            {name = "luasnip";}
            {name = "crates";}
            {name = "buffer";}
          ];
        };
      };
    };
  };
}
