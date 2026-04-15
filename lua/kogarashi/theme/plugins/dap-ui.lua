local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    DapUIFloatNormal = { link = "NormalFloat" },
    DapUIFloatBorder = { link = "FloatBorder" },
    DapUIDecoration = { fg = c.base.dimmed3 },
    DapUIType = { link = "Type" },
    DapUIValue = { fg = c.base.yellow },
    DapUIModifiedValue = { fg = c.base.orange, bold = true },
    DapUIVariable = { fg = c.base.white },
    DapUIScope = { fg = c.base.cyan, bold = true },
    DapUIThread = { fg = c.base.green },
    DapUIStoppedThread = { fg = c.base.cyan, bold = true },
    DapUIFrameName = { fg = c.base.white },
    DapUISource = { fg = c.base.dimmed1 },
    DapUILineNumber = { fg = c.base.yellow },
    DapUIWatchesEmpty = { fg = c.inputValidation.errorForeground },
    DapUIWatchesValue = { fg = c.base.green },
    DapUIWatchesError = { fg = c.inputValidation.errorForeground },
    DapUIBreakpointsPath = { fg = c.base.cyan },
    DapUIBreakpointsInfo = { fg = c.base.green },
    DapUIBreakpointsCurrentLine = { fg = c.base.yellow, bold = true },
    DapUIBreakpointsDisabledLine = { fg = c.base.dimmed4 },
  }
end

return M
