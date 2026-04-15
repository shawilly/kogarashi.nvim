local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    FlashBackdrop = { fg = c.base.dimmed4 },
    FlashMatch = { bg = c.editor.findMatchBackground, fg = c.base.yellow, bold = true },
    FlashCurrent = { bg = c.editor.wordHighlightBackground, fg = c.base.orange, bold = true },
    FlashLabel = { bg = c.base.orange, fg = c.base.black, bold = true },
    FlashPrompt = { link = "NormalFloat" },
    FlashPromptIcon = { fg = c.base.cyan },
    FlashCursor = { reverse = true },
  }
end

return M
