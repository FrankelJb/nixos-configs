{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      defaults = {
        file_ignore_patterns = [
          "^.git/"
          "^output/"
          "^target/"
        ];

        keymaps = {
          "<c-t>" = "open_with_trouble";
          "<a-t>" = "open_selected_with_trouble";
          "<a-i>" = "find_files_no_ignore";
          "<a-h>" = "find_files_with_hidden";
          "<C-Down>" = "actions.cycle_history_next";
          "<C-Up>" = "actions.cycle_history_prev";
          "<C-f>" = "actions.preview_scrolling_down";
          "<C-b>" = "actions.preview_scrolling_up";
        };
      };
    };
    keymaps = [
      {
        key = "<leader>,";
        action = "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>";
        options.desc = "Grep Files";
      }
      {
        key = "<leader>/";
        action = "<cmd>Telescope live_grep<cr>";
        options.desc = "Grep (Root Dir)";
      }
      {
        key = "<leader>:";
        action = "<cmd>Telescope command_history<cr>";
        options.desc = "Command History";
      }
      {
        key = "<leader><space>";
        action = "<cmd>Telescope find_files<cr>";
        options.desc = "Find Files (Root Dir)";
      }
      {
        key = "<leader>fb";
        action = "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>";
        options.desc = "Buffers";
      }
      {
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
        options.desc = "Find Files (Root Dir)";
      }
      {
        key = "<leader>fg";
        action = "<cmd>Telescope git_files<cr>";
        options.desc = "Find Files (git-files)";
      }
      {
        key = "<leader>fr";
        action = "<cmd>Telescope oldfiles<cr>";
        options.desc = "Recent";
      }
      # git
      {
        key = "<leader>gc";
        action = "<cmd>Telescope git_commits<CR>";
        options.desc = "Commits";
      }
      {
        key = "<leader>gs";
        action = "<cmd>Telescope git_status<CR>";
        options.desc = "Status";
      }
      # search
      {
        key = "<leader>s\"";
        action = "<cmd>Telescope registers<cr>";
        options.desc = "Registers";
      }
      {
        key = "<leader>sa";
        action = "<cmd>Telescope autocommands<cr>";
        options.desc = "Auto Commands";
      }
      {
        key = "<leader>sb";
        action = "<cmd>Telescope current_buffer_fuzzy_find<cr>";
        options.desc = "Buffer";
      }
      {
        key = "<leader>sc";
        action = "<cmd>Telescope command_history<cr>";
        options.desc = "Command History";
      }
      {
        key = "<leader>sC";
        action = "<cmd>Telescope commands<cr>";
        options.desc = "Commands";
      }
      {
        key = "<leader>sd";
        action = "<cmd>Telescope diagnostics bufnr=0<cr>";
        options.desc = "Document Diagnostics";
      }
      {
        key = "<leader>sD";
        action = "<cmd>Telescope diagnostics<cr>";
        options.desc = "Workspace Diagnostics";
      }
      {
        key = "<leader>sg";
        action = "<cmd>Telescope live_grep<cr>";
        options.desc = "Grep (Root Dir)";
      }
      {
        key = "<leader>sh";
        action = "<cmd>Telescope help_tags<cr>";
        options.desc = "Help Pages";
      }
      {
        key = "<leader>sH";
        action = "<cmd>Telescope highlights<cr>";
        options.desc = "Search Highlight Groups";
      }
      {
        key = "<leader>sk";
        action = "<cmd>Telescope keymaps<cr>";
        options.desc = "Key Maps";
      }
      {
        key = "<leader>sM";
        action = "<cmd>Telescope man_pages<cr>";
        options.desc = "Man Pages";
      }
      {
        key = "<leader>sm";
        action = "<cmd>Telescope marks<cr>";
        options.desc = "Jump to Mark";
      }
      {
        key = "<leader>so";
        action = "<cmd>Telescope vim_options<cr>";
        options.desc = "Options";
      }
      {
        key = "<leader>sR";
        action = "<cmd>Telescope resume<cr>";
        options.desc = "Resume";
      }
      {
        key = "<leader>sw";
        action = "<cmd>Telescope grep_string<cr>";
        options.desc = "Word (Root Dir)";
      }
    ];
  };
}
