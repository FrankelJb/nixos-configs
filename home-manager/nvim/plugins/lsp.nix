{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      keymaps.lspBuf = {
        "gD" = {
          action = "declaration";
          desc = "Goto Declaration";
        };
        "K" = {
          action = "hover";
          desc = "Hover";
        };
        "gK" = {
          action = "signature_help";
          desc = "Signature Help";
        };
        "gr" = {
          action = "references";
          desc = "Goto References";
        };
        "<leader>ca" = {
          action = "code_action";
          desc = "Code Action";
        };

        "<leader>cr" = {
          action = "rename";
          desc = "Replace";
        };
      };
      servers = {
        denols.enable = true;
        lua-ls.enable = true;
        nil_ls.enable = true;
        pylsp.enable = true;
        # typst-lsp.enable = true;
        yamlls.enable = true;
      };
    };
    keymaps = [
      {
        key = "<leader>cl";
        action = "<cmd>LspInfo<cr>";
        options.desc = "Lsp Info";
      }
      {
        key = "gd";
        action = {
          __raw = ''function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end'';
        };
        options.desc = "Goto Definition";
      }
      {
        key = "gr";
        action = "<cmd>Telescope lsp_references<cr>";
        options.desc = "References";
      }
      {
        key = "gI";
        action = {
          __raw = ''function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end'';
        };
        options.desc = "Goto Implementation";
      }
      {
        key = "gy";
        action = {
          __raw = ''function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end'';
        };
        options.desc = "Goto T[y]pe Definition";
      }
      {
        key = "<leader>cc";
        action = "vim.lsp.codelens.run";
        options.desc = "Run Codelens";
        mode = [
          "n"
          "v"
        ];
      }
      {
        key = "<leader>cC";
        action = "vim.lsp.codelens.refresh";
        options.desc = "Refresh & Display Codelens";
        mode = "n";
      }
    ];
  };
}
