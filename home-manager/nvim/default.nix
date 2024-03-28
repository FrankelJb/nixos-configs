{pkgs, ...}: {
  home.packages = with pkgs; [
    deadnix
    statix
  ];

  imports = [
    ./cmp.nix
    ./gitsigns.nix
    ./keymaps.nix
    ./lazygit.nix
    ./neo-tree.nix
    ./options.nix
  ];

  programs.nixvim = {
    enable = true;
    autoCmd = import ./autocmds.nix;
    # import ./autocmds.nix;
    # to install plugins just activate their modules
    colorschemes.tokyonight.enable = true;
    extraPlugins = with pkgs.vimPlugins; [
      dressing-nvim
      neoconf-nvim
      neodev-nvim
      nui-nvim
      nvim-web-devicons
      vim-startuptime
      vim-sneak
      vim-vsnip
    ];
    globals.mapleader = " ";
    # keymaps = import ./keymaps.nix;
    plugins = {
      bufferline = {
        enable = true;
        closeCommand = "function(n) require(\"mini.bufremove\").delete(n, false) end";
        rightMouseCommand = "function(n) require(\"mini.bufremove\").delete(n, false) end";
        diagnostics = "nvim_lsp";
        alwaysShowBufferline = false;
        diagnosticsIndicator = ''
          function(_, _, diag)
            local icons = require("lazyvim.config").icons.diagnostics
            local ret = (diag.error and icons.Error .. diag.error .. " " or "")
              .. (diag.warning and icons.Warn .. diag.warning or "")
            return vim.trim(ret)
          end
        '';
        offsets = [
          {
            "filetype" = "neo-tree";
            "text" = "Neo-tree";
            "highlight" = "Directory";
            "text_align" = "left";
          }
        ];
      };
      conform-nvim = {
        enable = true;
        formatOnSave = ''
          {
            timeout_ms = 500,
            lsp_fallback = true,
          }
        '';
        formattersByFt = {
          lua = ["stylua"];
          javascript = [["prettierd" "prettier"]];
          nix = ["alejandra"];
          python = ["isort" "black"];
          # Use the "*" filetype to run formatters on all filetypes.
          "*" = ["codespell"];
          # Use the "_" filetype to run formatters on filetypes that don't
          # have other formatters configured.
          "_" = ["trim_whitespace"];
        };
      };
      dashboard.enable = true;
      floaterm.enable = true;
      friendly-snippets.enable = true;
      indent-blankline.enable = true;
      lsp = {
        enable = true;
        servers = {
          hls.enable = true;
          nil_ls.enable = true;
          rust-analyzer.enable = true;
        };
      };
      lualine.enable = true;
      luasnip = {
        enable = true;
      };
      mini = {
        enable = true;
        modules = {
          ai = {};
          bufremove = {};
          comment = {};
          indentscope = {
            symbol = "│";
            options = {try_as_border = true;};
          };
          surround = {
            mappings = {
              add = "gsa";
              delete = "gsd";
              find = "gsf";
              find_left = "gsF";
              highlight = "gsh";
              replace = "gsr";
              update_n_lines = "gsn";
            };
          };
          jump = {};
        };
      };
      lightline.enable = true;
      lspkind.enable = true;
      lint.enable = true;
      neogit.enable = true;
      noice = {
        enable = true;
        lsp = {
          override = {
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.stylize_markdown" = true;
            "cmp.entry.get_documentation" = true;
          };
        };
        presets = {
          bottom_search = true;
          command_palette = true;
          long_message_to_split = true;
          inc_rename = true;
        };
      };
      none-ls.enable = true;
      notify.enable = true;
      nvim-autopairs.enable = true;
      nvim-colorizer.enable = true;
      persistence.enable = true;
      rainbow-delimiters.enable = true;
      telescope.enable = true;
      treesitter = {
        enable = true;
        indent = true;
      };
      treesitter-textobjects.enable = true;
      treesitter-context.enable = true;
      which-key.enable = true;
    };
  };
}
