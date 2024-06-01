-- Some color overrides
-- Modes plugin will handle the per-mode color settings though
vim.api.nvim_set_hl(0, 'rCursor', { fg = '#d70000', ctermbg = 124 })

-- A nice way to lay out my cursor conf
local cursor_config = {
  'a:block',
  'ci:ver10',
}

--		set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
--		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
--		  \,sm:block-blinkwait175-blinkoff150-blinkon175
vim.opt.guicursor = table.concat(cursor_config, ',')
