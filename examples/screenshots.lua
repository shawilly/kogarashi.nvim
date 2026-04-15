local source = debug.getinfo(1, "S").source:sub(2)
local repo_root = vim.fn.fnamemodify(source, ":p:h:h")
local sample = "AaBbCc XxYyZz 0123456789 <>[]{} ()"

vim.opt.runtimepath:prepend(repo_root)

local ponokai = require("kogarashi")

ponokai.setup({
  terminal_colors = true,
  transparent_background = false,
  devicons = true,
  background_clear = {
    "toggleterm",
    "telescope",
    "renamer",
    "notify",
    "neo-tree",
    "nvim-tree",
  },
  plugins = {
    bufferline = {
      underline_selected = false,
      underline_visible = false,
      underline_fill = false,
      bold = true,
    },
    indent_blankline = {
      context_highlight = "accent",
      context_start_underline = false,
    },
  },
})

vim.o.termguicolors = true
vim.o.laststatus = 0
vim.o.showtabline = 0
vim.o.cmdheight = 0
vim.o.fillchars = "eob: "
vim.cmd.colorscheme("kogarashi")

local function collect_groups()
  local seen = {}
  local groups = {}

  for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
    if group ~= "" and not seen[group] then
      seen[group] = true
      table.insert(groups, group)
    end
  end

  table.sort(groups, function(left, right)
    return left:lower() < right:lower()
  end)

  return groups
end

local function render_highlights()
  local buf = vim.api.nvim_get_current_buf()
  local groups = collect_groups()
  local name_width = 0

  for _, group in ipairs(groups) do
    name_width = math.max(name_width, #group)
  end

  local title = "Kogarashi Highlight Groups"
  local subtitle = string.format("groups=%d", #groups)
  local separator = string.rep("=", math.max(#title, #subtitle))
  local lines = {
    title,
    subtitle,
    separator,
    "",
  }
  local samples = {}

  for _, group in ipairs(groups) do
    local prefix = string.format("%-" .. name_width .. "s  ", group)
    table.insert(lines, prefix .. sample)
    table.insert(samples, {
      group = group,
      line = #lines - 1,
      start_col = #prefix,
      end_col = #prefix + #sample,
    })
  end

  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
  vim.bo[buf].modifiable = true
  vim.bo[buf].filetype = "kogarashi-screenshot"

  vim.wo.number = false
  vim.wo.relativenumber = false
  vim.wo.cursorline = false
  vim.wo.signcolumn = "no"
  vim.wo.foldcolumn = "0"
  vim.wo.wrap = false
  vim.wo.list = false

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_clear_namespace(buf, -1, 0, -1)

  for _, entry in ipairs(samples) do
    pcall(vim.api.nvim_buf_add_highlight, buf, -1, entry.group, entry.line, entry.start_col, entry.end_col)
  end

  vim.bo[buf].modifiable = false
  vim.api.nvim_win_set_cursor(0, { 1, 0 })
end

vim.api.nvim_create_user_command("KogarashiScreenshotRefresh", render_highlights, {})

render_highlights()
