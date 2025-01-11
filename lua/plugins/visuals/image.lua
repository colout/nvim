return {
  "3rd/image.nvim",
  lazy = false,
  opts = function()
    require("image").setup({
      backend = "kitty",
      name = "lsp_wants_this_field_so_i_put_this_here",
      kitty_method = "normal",
      editor_only_render_when_focused = true, -- auto show/hide images when the editor gains/looses focus
      tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
      window_overlap_clear_enabled = true, -- auto show/hide images when the editor gains/looses focus
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          filetypes = { "markdown", "mdx" },
          only_render_image_at_cursor = true,
          floating_windows = true,
          download_remote_images = true,
        },
      },
    })
  end,
}
