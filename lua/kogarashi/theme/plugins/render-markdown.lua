local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    RenderMarkdownH1 = { fg = c.base.red, bold = true },
    RenderMarkdownH2 = { fg = c.base.orange, bold = true },
    RenderMarkdownH3 = { fg = c.base.yellow, bold = true },
    RenderMarkdownH4 = { fg = c.base.green, bold = true },
    RenderMarkdownH5 = { fg = c.base.cyan, bold = true },
    RenderMarkdownH6 = { fg = c.base.magenta, bold = true },
    RenderMarkdownCode = { bg = c.editor.lineHighlightBackground },
    RenderMarkdownCodeInline = { bg = c.editor.lineHighlightBackground, fg = c.base.yellow },
    RenderMarkdownBullet = { fg = c.base.orange },
    RenderMarkdownQuote = { fg = c.base.green, italic = true },
    RenderMarkdownTableHead = { fg = c.base.cyan, bold = true },
    RenderMarkdownTableRow = { fg = c.base.white },
    RenderMarkdownSuccess = { fg = c.inputValidation.okForeground },
    RenderMarkdownInfo = { fg = c.inputValidation.infoForeground },
    RenderMarkdownHint = { fg = c.base.magenta },
    RenderMarkdownWarn = { fg = c.inputValidation.warningForeground },
    RenderMarkdownError = { fg = c.inputValidation.errorForeground },
  }
end

return M
