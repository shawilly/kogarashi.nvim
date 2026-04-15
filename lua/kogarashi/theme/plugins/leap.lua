local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    LeapMatch = { bg = c.editor.wordHighlightBackground, fg = c.base.cyan, bold = true },
    LeapLabelPrimary = { bg = c.base.yellow, fg = c.base.black, bold = true },
    LeapLabelSecondary = { bg = c.base.orange, fg = c.base.black, bold = true },
    LeapBackdrop = { fg = c.base.dimmed4 },
    LeapMatchBracket = { fg = c.base.red, bold = true },
  }
end

return M
