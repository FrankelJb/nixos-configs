{pkgs, ...}: {
  home.packages = with pkgs; [
    deadnix
    statix
  ];

  imports = [
    ./bufferline.nix
    ./cmp.nix
    ./gitsigns.nix
    ./keymaps.nix
    ./lazygit.nix
    ./lsp.nix
    ./mini.nix
    ./neo-tree.nix
    ./options.nix
    ./telescope.nix
    ./which-key.nix
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
      nvim-spectre
      nvim-web-devicons
      vim-startuptime
      vim-vsnip
    ];
    globals.mapleader = " ";
    # keymaps = import ./keymaps.nix;
    plugins = {
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
      illuminate.enable = true;
      indent-blankline.enable = true;
      lualine.enable = true;
      lsp = {
        enable = true;
        servers = {
          hls.enable = true;
          nil_ls.enable = true;
          rust-analyzer.enable = true;
        };
      };
      luasnip = {
        enable = true;
      };
      lightline.enable = true;
      lspkind.enable = true;
      lint = {
        enable = true;
        lintersByFt = {
          nix = ["statix"];
          lua = ["selene"];
          python = ["flake8"];
        };
      };
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
      treesitter = {
        enable = true;
        indent = true;
      };
      treesitter-textobjects.enable = true;
      treesitter-context.enable = true;
      ts-context-commentstring.enable = true;
      todo-comments.enable = true;
      trouble.enable = true;
    };
  };
}
