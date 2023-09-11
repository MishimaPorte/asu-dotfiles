local db = require("dbee")
local layout = require("dbee.utils").layout
local m = {}
-- db.install()
db.setup({
  -- lazy load the plugin or not?
  lazy = true,
  -- loads connections from files and environment variables
  sources = {
    -- require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
    require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee/persistence.json"),
  },
  -- extra table helpers per connection type
  extra_helpers = {
    -- example:
    ["postgres"] = {
      ["List All"] = "select * from {schema}.{table}",
    },
  },

  -- number of rows in the results set to display per page
  page_size = 100,

  -- drawer window config
  drawer = {
    -- show help or not
    disable_help = false,
    -- mappings for the buffer
    mappings = {
      -- manually refresh drawer
      refresh = { key = "r", mode = "n" },
      -- actions perform different stuff depending on the node:
      -- action_1 opens a scratchpad or executes a helper
      action_1 = { key = "<CR>", mode = "n" },
      -- action_2 renames a scratchpad or sets the connection as active manually
      action_2 = { key = "cw", mode = "n" },
      -- action_3 deletes a scratchpad or connection (removes connection from the file if you configured it like so)
      action_3 = { key = "dd", mode = "n" },
      -- these are self-explanatory:
      -- collapse = { key = "c", mode = "n" },
      -- expand = { key = "e", mode = "n" },
      toggle = { key = "o", mode = "n" },
    },
    -- icon settings:
    disable_candies = false,
    candies = {
      -- these are what's available for now:
      history = {
        icon = "",
        icon_highlight = "Constant",
      },
      scratch = {
        icon = "",
        icon_highlight = "Character",
      },
      database = {
        icon = "",
        icon_highlight = "SpecialChar",
      },
      table = {
        icon = "",
        icon_highlight = "Conditional",
      },
      add = {
        icon = "",
        icon_highlight = "String",
        text_highlight = "String",
      },
      edit = {
        icon = "󰏫",
        icon_highlight = "Directory",
        text_highlight = "Directory",
      },
      remove = {
        icon = "󰆴",
        icon_highlight = "SpellBad",
        text_highlight = "SpellBad",
      },
      help = {
        icon = "󰋖",
        icon_highlight = "Title",
        text_highlight = "Title",
      },
      source = {
        icon = "󰃖",
        icon_highlight = "MoreMsg",
        text_highlight = "MoreMsg",
      },

      -- if there is no type
      -- use this for normal nodes...
      none = {
        icon = " ",
      },
      -- ...and use this for nodes with children
      none_dir = {
        icon = "",
        icon_highlight = "NonText",
      },

      -- chevron icons for expanded/closed nodes
      node_expanded = {
        icon = "",
        icon_highlight = "NonText",
      },
      node_closed = {
        icon = "",
        icon_highlight = "NonText",
      },
    },
  },

  -- results window config
  result = {
    -- mappings for the buffer
    mappings = {
      -- next/previous page
      page_next = { key = "L", mode = "" },
      page_prev = { key = "H", mode = "" },
      -- yank rows as csv/json
      yank_current_json = { key = "yaj", mode = "n" },
      yank_selection_json = { key = "yaj", mode = "v" },
      yank_all_json = { key = "yaJ", mode = "" },
      yank_current_csv = { key = "yac", mode = "n" },
      yank_selection_csv = { key = "yac", mode = "v" },
      yank_all_csv = { key = "yaC", mode = "" },
    },
  },

  -- editor window config
  editor = {
    -- mappings for the buffer
    mappings = {
      -- run what's currently selected on the active connection
      run_selection = { key = "BB", mode = "v" },
      -- run the whole file on the active connection
      run_file = { key = "BB", mode = "n" },
    },
  },

  -- general UI config
  -- Default configuration uses a "layout" helper to save the existing ui before opening any windows,
  -- then makes a new empty window for the editor and then opens result and drawer.
  -- When later calling dbee.close(), the previously saved layout is restored.
  -- NOTE: "m" is just a global object - nothing special about it - you might as well just use global vars.
  --
  -- You can probably do anything you imagine with this - for example all floating windows, tiled/floating mix etc.
  ui = {
    -- commands that opens the window if the window is closed - for drawer/editor/result
    -- string or function
    window_commands = {
      drawer = "to 40vsplit",
      result = "bo 15split",
      editor = function()
        vim.cmd("new")
        vim.cmd("only")
        m.tmp_buf = vim.api.nvim_get_current_buf()
        return vim.api.nvim_get_current_win()
      end,
    },
    -- how to open windows in order (with specified "window_command"s -- see above)
    window_open_order = { "editor", "result", "drawer" },

    -- hooks before/after dbee.open()/.close()
    pre_open_hook = function()
      -- save layout before opening ui
      m.egg = layout.save()
    end,
    post_open_hook = function()
      -- delete temporary editor buffer
      vim.cmd("bd " .. m.tmp_buf)
    end,
    pre_close_hook = function() end,
    post_close_hook = function()
      layout.restore(m.egg)
      m.egg = nil
    end,
  },
})
