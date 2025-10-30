dap = require("dap")
local util = require('lspconfig/util')
local opts = { noremap=true, silent=true }
local path = util.path
map = vim.keymap.set

map('n', 'B', dap.toggle_breakpoint, opts) -- set/remove breakpoint
map('n', '<leader>C', dap.continue, opts)
map('n', '<leader>x', dap.terminate, opts)
map('n', 'F', dap.step_over, opts) -- dont know what is it
map('n', '<leader>F', dap.step_into, opts) -- step into (a function)
map('n', '<leader>u', dap.step_out, opts) -- step out (of a function)
vim.api.nvim_create_user_command('DEBUG', dap.continue, {})

dap.repl.omnifunc = vim.lsp.omnifunc
local function getVenv(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end
  -- Find and use virtualenv via poetry in workspace directory.
  local match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
  if match ~= '' then
    local venv = vim.fn.trim(vim.fn.system('poetry env info -p 2> /dev/null'))
    return path.join(venv, 'bin', 'python')
  end

  -- Fallback to system Python.
   return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/home/asu/miscellaneous/vscode-cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dap.adapters.python = function(cb, config)
  if config.request == 'attach' then
    local port = (config.connect or config).port
    local host = (config.connect or config).host or '127.0.0.1'
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
  else
    cb({
      type = 'executable',
      command = getVenv(),
      args = { '-m', 'debugpy.adapter' },
      options = {
        source_filetype = 'python',
      },
    })
  end
end

dap.configurations.python = {
  {
    type = 'python'; 
    request = 'launch';
    name = "main.py";
    program = "main.py"; 
    pythonPath = getVenv;
  },
  {
    type = 'python'; 
    request = 'launch';
    name = "proj";
    program = "src"; 
    pythonPath = getVenv;
  },
  {
    type = 'python'; 
    request = 'launch';
    name = "test";
    module = 'pytest';
    pythonPath = getVenv;
  },
}

--i will never remember this many hotkeys
dapui = require("dapui")
dapui.setup()
-- this anon function shit is needed to jump into floating windows once they are open
map('n', '<F7>', dapui.toggle, opts) -- open many dapui windows to see my stupid code working
map('n', '<leader>E', function() dapui.eval(); dapui.eval() end, opts) -- evaluate expression
map('v', '<leader>E', function() dapui.eval(); dapui.eval() end, opts) -- evaluate expression in chunks with visual mode
map('n', '<leader>R', function() dapui.float_element("repl")  end, opts) -- open floating repl - sounds convenient
-- map('n', '<leader>C', function() dapui.float_element("console")  end, opts) -- floating console - does nothing in python
map('n', '<leader>fq', function() dapui.float_element("breakpoints"); dapui.float_element("breakpoints") end, opts) -- open floating breakpoints pane
map('n', '<leader>fw', function() dapui.float_element("watches"); dapui.float_element("watches")end, opts) -- open floating breakpoints pane
map('n', '<leader>fs', function() dapui.float_element("stacks"); dapui.float_element("stacks") end, opts) -- open floating stack pane
map('n', '<leader>fe', function() dapui.float_element("scopes"); dapui.float_element("scopes") end, opts) -- open floating variable scopes pane
