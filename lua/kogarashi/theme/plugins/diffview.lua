local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    DiffviewNormal = { link = "Normal" },
    DiffviewCursorLine = { link = "CursorLine" },
    DiffviewVertSplit = { link = "VertSplit" },
    DiffviewStatusAdded = { fg = c.gitDecoration.addedResourceForeground },
    DiffviewStatusModified = { fg = c.gitDecoration.modifiedResourceForeground },
    DiffviewStatusRenamed = { fg = c.base.cyan },
    DiffviewStatusCopied = { fg = c.base.cyan },
    DiffviewStatusDeleted = { fg = c.gitDecoration.deletedResourceForeground },
    DiffviewFilePanelTitle = { fg = c.base.red, bold = true },
    DiffviewFilePanelCounter = { fg = c.base.yellow, bold = true },
    DiffviewFilePanelFileName = { fg = c.base.white },
    DiffviewFilePanelSelected = { bg = c.list.activeSelectionBackground, bold = true },
    DiffviewDiffAdd = { link = "DiffAdd" },
    DiffviewDiffChange = { link = "DiffChange" },
    DiffviewDiffDelete = { link = "DiffDelete" },
    DiffviewDiffText = { link = "DiffText" },
  }
end

return M
