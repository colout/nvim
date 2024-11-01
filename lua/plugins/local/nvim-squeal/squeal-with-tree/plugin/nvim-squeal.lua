local NuiTree = require 'nui.tree'
local Split = require 'nui.split'
local NuiLine = require 'nui.line'
local state = require 'state_manager'

-- Configs
local split = Split {
  relative = 'win',
  position = 'left',
  size = 30,
}

local map_options = { noremap = true, nowait = true }

-- Tree Actions
local function node_activate(tree)
  local node = state.get_value('tree'):get_node()
  print(vim.inspect(node))

  -- Expand/contract
  if node:is_expanded() then
    if node:collapse() then
      state.get_value('tree'):render()
    end
  else
    if node:expand() then
      state.get_value('tree'):render()
    end
  end
end

local function tree_new()
  state.set_value(
    'tree',
    NuiTree {
      winid = split.winid,
      bufnr = split.bufnr,
      nodes = {
        NuiTree.Node { text = 'a' },
        NuiTree.Node({ text = 'b' }, {
          NuiTree.Node { text = 'b-1' },
          NuiTree.Node({ text = 'b-2' }, {
            NuiTree.Node { text = 'b-1-a' },
            NuiTree.Node { text = 'b-2-b' },
          }),
        }),
        NuiTree.Node({ text = 'c' }, {
          NuiTree.Node { text = 'c-1' },
          NuiTree.Node { text = 'c-2' },
        }),
      },
      prepare_node = function(node)
        local line = NuiLine()

        line:append(string.rep('  ', node:get_depth() - 1))

        if node:has_children() then
          line:append(node:is_expanded() and ' ' or ' ', 'SpecialChar')
        else
          line:append '  '
        end

        line:append(node.text)

        return line
      end,
    }
  )
end

-- Assign keymaps
local function assign_keymaps()
  local tree = state.get_value 'tree'
  -- quit
  split:map('n', 'q', function()
    split:unmount()
  end, { noremap = true })

  -- print current node
  split:map('n', '<CR>', function()
    node_activate(tree)
  end, map_options)

  -- collapse current node
  split:map('n', 'h', function()
    local node = tree:get_node()

    if node:collapse() then
      tree:render()
    end
  end, map_options)

  -- collapse all nodes
  split:map('n', 'H', function()
    local updated = false

    for _, node in pairs(tree.nodes.by_id) do
      updated = node:collapse() or updated
    end

    if updated then
      tree:render()
    end
  end, map_options)
end

local function db_browser_create()
  split:mount()
  tree_new()
  assign_keymaps()

  tree = state.get_value('tree'):render()
end

-- Commands
vim.api.nvim_create_user_command('Squeal', function()
  db_browser_create()
end, {})

vim.api.nvim_create_user_command('SqealAdd', function() end, {})

db_browser_create()
