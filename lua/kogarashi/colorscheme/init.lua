local Util = require("kogarashi.util")
local Config = require("kogarashi.config")

---@class ColorschemeOptions
local cs = {}

---@class Colorscheme: ColorschemeOptions
local M = setmetatable({}, {
  __index = function(m, k)
    local color = rawget(cs or {}, k)
    if color == nil then
      cs = m()
    end
    return rawget(cs or {}, k)
  end,
  __call = function(t, ...)
    return t.get(...)
  end,
})

local hp = require("kogarashi.color_helper")

---@return ColorschemeOptions
M.get = function()
  ---@module "kogarashi.colorscheme.palette.kogarashi"
  local kogarashi_palette = require("kogarashi.colorscheme.palette.kogarashi")
  local colors =
    vim.tbl_deep_extend("force", kogarashi_palette, Config.overridePalette and Config.overridePalette() or {})

  cs.editor = {
    background = Config.transparent_background and "NONE" or colors.background,
    foreground = colors.text,
    lineHighlightBackground = hp.blend(colors.dimmed1, 0.06, colors.background),
    selectionBackground = hp.blend(colors.blue, 0.16, colors.background),
    findMatchBackground = hp.blend(colors.yellow, 0.2, colors.background),
    findMatchBorder = colors.yellow,
    findMatchHighlightBackground = hp.blend(colors.blue, 0.12, colors.background),
    foldBackground = hp.blend(colors.dimmed5, 0.45, colors.background),
    wordHighlightBackground = hp.blend(colors.blue, 0.1, colors.background),
    selectionHighlightBackground = hp.blend(colors.purple, 0.1, colors.background),
    wordHighlightStrongBackground = hp.blend(colors.orange, 0.14, colors.background),
  }

  cs.editorLineNumber = {
    foreground = colors.dimmed3,
    activeForeground = colors.yellow,
  }

  cs.editorHoverWidget = {
    background = colors.dark1,
    border = colors.dimmed5,
  }

  cs.editorSuggestWidget = {
    background = colors.dark1,
    border = colors.dimmed5,
    foreground = colors.dimmed1,
    highlightForeground = colors.text,
    selectedBackground = hp.blend(colors.blue, 0.14, colors.dark1),
  }

  cs.editorIndentGuide = {
    background = colors.dimmed5,
    activeBackground = colors.dimmed3,
  }

  cs.editorInlayHint = {
    background = hp.blend(colors.yellow, 0.1, colors.background),
    foreground = hp.lighten(colors.dimmed2, 3),
  }

  cs.editorGutter = {
    addedBackground = colors.green,
    deletedBackground = colors.red,
    modifiedBackground = colors.orange,
  }

  cs.sideBar = {
    background = colors.background,
    foreground = colors.text,
  }

  cs.sideBarTitle = {
    foreground = colors.dimmed4,
  }

  cs.list = {
    activeSelectionBackground = hp.blend(colors.blue, 0.12, cs.sideBar.background),
  }

  cs.sideBarSectionHeader = {
    foreground = colors.red,
  }

  cs.breadcrumb = {
    foreground = colors.dimmed2,
  }

  cs.button = {
    background = colors.dimmed5,
    foreground = colors.dimmed1,
    hoverBackground = colors.dimmed4,
    separator = colors.background,
  }

  cs.scrollbarSlider = {
    hoverBackground = hp.blend(colors.dimmed1, 0.2, colors.background),
  }

  cs.gitDecoration = colors.git
  cs.inputValidation = colors.diagnostics

  cs.errorLens = {
    errorBackground = colors.diagnostics.errorBackground,
    errorForeground = colors.diagnostics.errorForeground,
    warningBackground = colors.diagnostics.warningBackground,
    warningForeground = colors.diagnostics.warningForeground,
    infoBackground = colors.diagnostics.infoBackground,
    infoForeground = colors.diagnostics.infoForeground,
    hintBackground = colors.diagnostics.debugBackground,
    hintForeground = colors.diagnostics.debugForeground,
  }

  cs.terminal = {
    background = colors.dark1,
    foreground = colors.text,
  }

  cs.terminalCursor = {
    background = "#ffffff",
    foreground = colors.text,
  }

  cs.editorGroupHeader = {
    tabsBackground = colors.dark1,
    tabsBorder = colors.dimmed5,
  }

  cs.tab = {
    activeBackground = Config.transparent_background and "NONE" or colors.background,
    activeBorder = colors.yellow,
    activeForeground = colors.text,
    inactiveBackground = hp.blend(colors.dimmed5, 0.45, colors.background),
    inactiveForeground = colors.dimmed2,
    unfocusedActiveBackground = hp.blend(colors.dimmed5, 0.25, colors.background),
    unfocusedActiveBorder = colors.dimmed2,
    unfocusedActiveForeground = colors.dimmed1,
  }

  cs.statusBar = {
    background = colors.dark2,
    foreground = colors.dimmed3,
    activeForeground = colors.text,
  }

  cs.diffEditor = {
    insertedLineBackground = hp.blend(colors.green, 0.12, colors.background),
    removedLineBackground = hp.blend(colors.red, 0.12, colors.background),
    modifiedLineBackground = hp.blend(colors.orange, 0.12, colors.background),
  }

  cs.diffEditorOverview = {
    insertedForeground = hp.blend(colors.green, 0.65, cs.diffEditor.insertedLineBackground),
    removedForeground = hp.blend(colors.red, 0.65, cs.diffEditor.removedLineBackground),
    modifiedForeground = hp.blend(colors.orange, 0.65, cs.diffEditor.modifiedLineBackground),
  }

  cs.notifications = {
    background = colors.dark1,
    border = colors.dimmed5,
    foreground = colors.dimmed1,
  }
  cs.notificationsErrorIcon = {
    foreground = colors.diagnostics.errorForeground,
    background = colors.diagnostics.errorBackground,
    border = colors.diagnostics.errorBorder,
  }
  cs.notificationsInfoIcon = {
    foreground = colors.diagnostics.infoForeground,
    background = colors.diagnostics.infoBackground,
    border = colors.diagnostics.infoForeground,
  }
  cs.notificationsWarningIcon = {
    foreground = colors.diagnostics.warningForeground,
    background = colors.diagnostics.warningBackground,
    border = colors.diagnostics.warningBorder,
  }

  cs.base = {
    dark = colors.dark2,
    black = colors.dark1,
    red = colors.red,
    green = colors.green,
    yellow = colors.yellow,
    orange = colors.orange,
    magenta = colors.purple,
    cyan = colors.blue,
    white = colors.text,
    dimmed1 = colors.dimmed1,
    dimmed2 = colors.dimmed2,
    dimmed3 = colors.dimmed3,
    dimmed4 = colors.dimmed4,
    dimmed5 = colors.dimmed5,
  }

  cs = vim.tbl_deep_extend("force", cs, Config.overrideScheme and Config.overrideScheme(cs, colors, Config, hp) or {})

  return cs
end

return M
