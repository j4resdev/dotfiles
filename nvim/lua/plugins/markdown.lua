return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      require("lazy").load({ plugins = { "markdown-preview.nvim" } })
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      { "<F6>", ft = "markdown", "<cmd>RenderMarkdown toggle<cr>", desc = "Markdown Preview" },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    config = function()
    	local markdown = require("render-markdown")
      markdown.setup({
        checkbox = {
            -- Checkboxes are a special instance of a 'list_item' that start with a 'shortcut_link'.
            -- There are two special states for unchecked & checked defined in the markdown grammar.

            -- Turn on / off checkbox state rendering.
            enabled = true,
            -- Additional modes to render checkboxes.
            render_modes = false,
            -- Render the bullet point before the checkbox.
            bullet = false,
            -- Padding to add to the right of checkboxes.
            right_pad = 1,
            unchecked = {
                -- Replaces '[ ]' of 'task_list_marker_unchecked'.
                icon = '󰄱 ',
                -- Highlight for the unchecked icon.
                highlight = 'RenderMarkdownUnchecked',
                -- Highlight for item associated with unchecked checkbox.
                scope_highlight = nil,
            },
            checked = {
                -- Replaces '[x]' of 'task_list_marker_checked'.
                icon = ' ',
                -- Highlight for the checked icon.
                highlight = 'RenderMarkdownChecked',
                -- Highlight for item associated with checked checkbox.
                scope_highlight = nil,
            },
            custom = {
                todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
            },
        },

      })

    end,
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        markdown = { "markdownlint-cli2" },
      },
    },
  },
}
