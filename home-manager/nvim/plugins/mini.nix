{
  programs.nixvim.plugins.mini = {
    enable = true;
    modules = {
      ai = {
        n_lines = 500;
        custom_textobjects = {
          o = ''
            require("mini.ai").gen_spec.treesitter({
                a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                i = { "@block.inner", "@conditional.inner", "@loop.inner" },
                }, {})'';
          f = ''
            require("mini.ai").gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {})
          '';
          c = ''require("mini.ai").gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {})'';
          t = ''<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$'';
          d = "%f[%d]%d+";
          e = ''
            {
              "%u[%l%d]+%f[^%l%d]",
              "%f[%S][%l%d]+%f[^%l%d]",
              "%f[%P][%l%d]+%f[^%l%d]",
              "^[%l%d]+%f[^%l%d]",
            },
            "^().*()$"
          '';
          g = ''
              function()
              local from = { line = 1, col = 1 }
            local to = {
              line = vim.fn.line("$"),
              col = math.max(vim.fn.getline("$"):len(), 1),
            }
            return { from = from, to = to }
            end
          '';
          u = "require('mini.ai').gen_spec.function_call()";
          U = ''
            require("mini.ai").gen_spec.function_call({ name_pattern = "[%w_]" })'';
        };
      };
      bufremove = {};
      comment = {};
      indentscope = {
        symbol = "│";
        options = {try_as_border = true;};
      };
      pairs = {};
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
}
