local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    SnacksNormal = { link = "NormalFloat" },
    SnacksPicker = { link = "NormalFloat" },
    SnacksPickerBorder = { link = "FloatBorder" },
    SnacksPickerTitle = { fg = c.base.red, bold = true },
    SnacksPickerDir = { fg = c.base.dimmed2 },
    SnacksPickerPathHidden = { fg = c.base.dimmed4 },
    SnacksPickerMatch = { fg = c.base.orange, bold = true },
    SnacksPickerCursorLine = { link = "PmenuSel" },
    SnacksNotifierInfo = { fg = c.inputValidation.infoForeground },
    SnacksNotifierWarn = { fg = c.inputValidation.warningForeground },
    SnacksNotifierError = { fg = c.inputValidation.errorForeground },
    SnacksDashboardHeader = { fg = c.base.red, bold = true },
    SnacksDashboardDesc = { fg = c.base.dimmed2 },
    SnacksDashboardIcon = { fg = c.base.cyan },
    SnacksIndent = { fg = c.editorIndentGuide.background },
    SnacksIndentScope = { fg = c.editorIndentGuide.activeBackground },
  }
end

return M
