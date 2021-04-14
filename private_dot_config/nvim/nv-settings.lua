--[[
O is the global options object

Formatters and linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- general
O.auto_complete = true
O.colorscheme = 'gruvbox-material'
O.auto_close_tree = 0
O.wrap_lines = false

-- python
O.python.formatter = 'yapf'
O.python.isort = true
O.python.autoformat = true
O.python.diagnostics.virtual_text = true
O.python.diagnostics.signs = true
O.python.diagnostics.underline = true

-- lua
O.lua.formatter = 'lua-format'
O.lua.autoformat = true

-- javascript
O.tsserver.formatter = 'prettier'
O.tsserver.linter = nil
O.tsserver.autoformat = true

-- json
O.json.autoformat = true
