{ pkgs, ... }:
{
  home.packages = with pkgs; [
    deadnix
    statix
  ];

  imports = [
    ./keymaps.nix
    ./options.nix
    # TODO: install session saving
    ./plugins/aerial.nix
    ./plugins/barbar.nix
    ./plugins/cmp.nix
    ./plugins/conform.nix
    ./plugins/diffview.nix
    ./plugins/gitsigns.nix
    ./plugins/harpoon.nix
    ./plugins/lazygit.nix
    ./plugins/lsp.nix
    ./plugins/lualine.nix
    ./plugins/mini.nix
    ./plugins/neo-tree.nix
    ./plugins/rustaceanvim.nix
    ./plugins/spectre.nix
    ./plugins/telescope.nix
    ./plugins/todo-comments.nix
    ./plugins/treesitter.nix
    ./plugins/undotree.nix
    ./plugins/which-key.nix
    ./plugins/yanky.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.nixvim = {
    enable = true;
    autoCmd = import ./autocmds.nix;
    clipboard.register = "unnamedplus";
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
      alpha = {
        enable = true;
        theme = "dashboard";
      };
      crates-nvim.enable = true;
      floaterm.enable = true;
      friendly-snippets.enable = true;
      illuminate.enable = true;
      indent-blankline.enable = true;
      lint = {
        enable = true;
        lintersByFt = {
          nix = [ "statix" ];
          lua = [ "selene" ];
          python = [ "flake8" ];
        };
      };
      lspkind.enable = true;
      luasnip.enable = true;
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
        routes = [
          {
            view = "notify";
            filter = {
              event = "msg_showmode";
            };
          }
        ];
      };
      none-ls.enable = true;
      notify.enable = true;
      nvim-autopairs.enable = true;
      nvim-colorizer.enable = true;
      persistence.enable = true;
      rainbow-delimiters.enable = true;
      treesitter-textobjects.enable = true;
      treesitter-context.enable = true;
      ts-context-commentstring.enable = true;
      trouble.enable = true;
      typescript-tools.enable = true;
      typst-vim.enable = true;
    };
  };
}
