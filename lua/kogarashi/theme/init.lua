local Helper = require("kogarashi.color_helper")
local Util = require("kogarashi.util")
local Config = require("kogarashi.config")
local Colorscheme = require("kogarashi.colorscheme")

---@class KogarashiTheme
---@field mini kogarashi.theme.plugins.mini
local M = {}

setmetatable(M, {
  __index = function(_, k)
    local plugin = require("kogarashi.theme.plugins." .. k)
    return plugin
  end,
})

--- Map plugin highlight module names to their detection criteria
--- Each entry can have:
---   - module: lua module name to check (uses pcall require)
---   - global: vim global variable to check
---   - condition: custom function returning boolean
---   - always: if true, always load (for core integrations)
---@type table<string, {module?: string, global?: string, condition?: function, always?: boolean}>
local PLUGIN_DETECTION = {
  ["mini"] = { module = "mini" },
  ["aerial"] = { module = "aerial" },
  ["alpha"] = { module = "alpha" },
  ["beacon"] = { module = "beacon" },
  ["breadcrumb"] = { module = "breadcrumb" },
  ["bufferline"] = { module = "bufferline" },
  ["cmp"] = { module = "cmp" },
  ["coc"] = { global = "coc_global_extensions" },
  ["copilot"] = { module = "copilot" },
  ["dap"] = { module = "dap" },
  ["dap-ui"] = { module = "dapui" },
  ["dashboard"] = { module = "dashboard" },
  ["diffview"] = { module = "diffview" },
  ["dropbar"] = { module = "dropbar" },
  ["flash"] = { module = "flash" },
  ["fidget"] = { module = "fidget" },
  ["fzf-lua"] = { module = "fzf-lua" },
  ["gitsign"] = { module = "gitsigns" },
  ["harpoon"] = { module = "harpoon" },
  ["hop"] = { module = "hop" },
  ["illuminate"] = { module = "illuminate" },
  ["indent_blankline"] = { module = "ibl" },
  ["lazy"] = { module = "lazy" },
  ["leap"] = { module = "leap" },
  ["lsp"] = { always = true }, -- LSP is core neovim functionality
  ["mason"] = { module = "mason" },
  ["neo-tree"] = { module = "neo-tree" },
  ["neogit"] = { module = "neogit" },
  ["noice"] = { module = "noice" },
  ["notify"] = { module = "notify" },
  ["nvim-navic"] = { module = "nvim-navic" },
  ["nvim-tree"] = { module = "nvim-tree" },
  ["nvim-treesitter"] = { module = "nvim-treesitter" },
  ["nvim-ts-rainbow2"] = { module = "ts-rainbow" },
  ["packer"] = { module = "packer" },
  ["rainbow-delimiters"] = { module = "rainbow-delimiters" },
  ["renamer"] = { module = "renamer" },
  ["render-markdown"] = { module = "render-markdown" },
  ["scrollbar"] = { module = "scrollbar" },
  ["snacks"] = { module = "snacks" },
  ["telescope"] = { module = "telescope" },
  ["todo-comments"] = { module = "todo-comments" },
  ["toggleterm"] = { module = "toggleterm" },
  ["trouble"] = { module = "trouble" },
  ["ufo"] = { module = "ufo" },
  ["which-key"] = { module = "which-key" },
  ["wilder"] = { condition = function() return vim.fn.exists(":Wilder") == 2 end },
}

--- Check if a plugin is available/loaded
---@param name string Plugin name
---@return boolean
local function is_plugin_available(name)
  local detection = PLUGIN_DETECTION[name]
  if not detection then
    return true -- Unknown plugins are always loaded for backwards compatibility
  end

  if detection.always then
    return true
  end

  if detection.condition then
    local ok, result = pcall(detection.condition)
    return ok and result
  end

  if detection.global then
    return vim.g[detection.global] ~= nil
  end

  if detection.module then
    -- Check if the module is available without loading it
    -- Check package.loaded first (already loaded)
    if package.loaded[detection.module] then
      return true
    end
    -- Check if module exists in package.preload
    if package.preload[detection.module] then
      return true
    end
    -- Try to find the module path without loading
    local found = package.searchpath(detection.module, package.path)
    if found then
      return true
    end
    -- Check lazy.nvim's plugin list if available
    if package.loaded["lazy.core.config"] then
      local lazy_config = require("lazy.core.config")
      if lazy_config.plugins then
        -- Check common plugin name patterns
        local plugin_names = {
          detection.module,
          detection.module .. ".nvim",
          "nvim-" .. detection.module,
          detection.module:gsub("%.", "-"),
        }
        for _, name in ipairs(plugin_names) do
          if lazy_config.plugins[name] then
            return true
          end
        end
      end
    end
    return false
  end

  return true
end

---@enum SupportedPlugins
local PLUGINS = {
  "mini",
  "aerial",
  "alpha",
  "beacon",
  "breadcrumb",
  "bufferline",
  "cmp",
  "coc",
  "copilot",
  "dap",
  "dap-ui",
  "dashboard",
  "diffview",
  "dropbar",
  "flash",
  "fidget",
  "fzf-lua",
  "gitsign",
  "harpoon",
  "hop",
  "illuminate",
  "indent_blankline",
  "lazy",
  "leap",
  "lsp",
  "mason",
  "neo-tree",
  "neogit",
  "noice",
  "notify",
  "nvim-navic",
  "nvim-tree",
  "nvim-treesitter",
  "nvim-ts-rainbow2",
  "packer",
  "rainbow-delimiters",
  "renamer",
  "render-markdown",
  "scrollbar",
  "snacks",
  "telescope",
  "todo-comments",
  "toggleterm",
  "trouble",
  "ufo",
  "which-key",
  "wilder",
}

-- Get highlight group dictionary
-- Example:
-- local hl_groups = {
--   Normal = { bg = c.editor.background, fg = c.editor.foreground, }, -- normal text
--   ["@modifier"] = { fg = c.base.red, italic = true },
-- }
---@param colorscheme Colorscheme
---@return HighlightGroupTbl
local function get_hl_group_tbl(colorscheme)
  local editor = require("kogarashi.theme.editor").setup(colorscheme, Config, Helper)
  local syntax = require("kogarashi.theme.syntax").setup(colorscheme, Config, Helper)
  local semantic_tokens = require("kogarashi.theme.semantic_tokens").setup(colorscheme, Config, Helper)
  local extra = require("kogarashi.theme.extra").setup(colorscheme, Config, Helper)
  --  The HlGroups class represents a collection of highlighter groups.
  --  Each group is identified by a string key (e.g. "editor") and holds the result of calling the `setup` function of a corresponding highlighter module (e.g. `editor.setup`).
  --  The class has a single field, `hl_groups`, which is a table containing the highlighter groups.
  --- @type HighlightGroupTbl
  local hl_group_tbl = {}
  hl_group_tbl = vim.tbl_deep_extend("force", hl_group_tbl, editor, syntax, semantic_tokens, extra)

  -- Build set of enabled plugins if specified
  local enabled_set = nil
  if Config.enabled_plugins then
    enabled_set = {}
    for _, p in ipairs(Config.enabled_plugins) do
      enabled_set[p] = true
    end
  end

  for _, name in ipairs(PLUGINS) do
    -- Check if plugin is in enabled list (if specified)
    local is_enabled = enabled_set == nil or enabled_set[name]

    -- Check if plugin is available (if lazy loading is enabled)
    local is_available = not Config.lazy_plugins or is_plugin_available(name)

    if is_enabled and is_available then
      local config_ok, plugin = xpcall(require, function(...)
        Util.log("Failed to load highlight group: " .. name .. "\n" .. debug.traceback(...), "error")
        return ...
      end, "kogarashi.theme.plugins." .. name)
      if config_ok then
        hl_group_tbl = vim.tbl_deep_extend("force", hl_group_tbl, plugin.get(colorscheme, Config, Helper))
      end
    end
  end
  hl_group_tbl = vim.tbl_deep_extend("force", hl_group_tbl, Config.override and Config.override(colorscheme) or {})
  return hl_group_tbl
end

---@return HighlightGroupTbl
M.setup = function()
  local devicons = require("kogarashi.devicons")

  local colorscheme = Colorscheme()
  -- print(colorscheme.editor.background)
  -- print(colorscheme.tab.activeBackground)
  local hl_group_tbl = get_hl_group_tbl(colorscheme)
  -- print(Helper.lighten(colorscheme.tab.activeBackground, 10))
  -- M.temp = vim.tbl_deep_extend("force", colorscheme.tab or {}, true and {
  --   activeBackground = Helper.lighten(colorscheme.tab.activeBackground, 10),
  --   inactiveBackground = Helper.lighten(colorscheme.tab.inactiveBackground, 10),
  --   unfocusedActiveBackground = Helper.lighten(colorscheme.tab.unfocusedActiveBackground, 10),
  -- } or {})
  -- print(vim.inspect(M.temp))

  if Config.terminal_colors then
    Util.extra.terminal(Colorscheme)
  end

  if Config.devicons then
    devicons.setup(Colorscheme)
  end

  return hl_group_tbl
end

return M
