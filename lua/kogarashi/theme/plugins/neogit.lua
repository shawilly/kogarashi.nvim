local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    NeogitBranch = { fg = c.base.orange, bold = true },
    NeogitRemote = { fg = c.base.cyan },
    NeogitHunkHeader = { bg = c.editor.lineHighlightBackground, fg = c.base.dimmed1 },
    NeogitHunkHeaderHighlight = { bg = c.editor.selectionBackground, fg = c.base.white, bold = true },
    NeogitDiffContext = { fg = c.base.dimmed2 },
    NeogitDiffContextHighlight = { bg = c.editor.lineHighlightBackground, fg = c.base.dimmed1 },
    NeogitDiffAdd = { link = "DiffAdd" },
    NeogitDiffDelete = { link = "DiffDelete" },
    NeogitDiffAddHighlight = { bg = c.diffEditor.insertedLineBackground, fg = c.base.green },
    NeogitDiffDeleteHighlight = { bg = c.diffEditor.removedLineBackground, fg = c.base.red },
    NeogitNotificationInfo = { fg = c.inputValidation.infoForeground },
    NeogitNotificationWarning = { fg = c.inputValidation.warningForeground },
    NeogitNotificationError = { fg = c.inputValidation.errorForeground },
  }
end

return M
