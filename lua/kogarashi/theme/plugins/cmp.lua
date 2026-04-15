local M = {}

--- @param c Colorscheme The color palette
--- @param hp Helper
function M.get(c, _, hp)
  return {
    CmpItemAbbrMatch = { fg = c.editorSuggestWidget.highlightForeground, bold = true }, -- text match in order
    CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" }, -- text match not in order
    CmpItemMenu = { fg = hp.lighten(c.editorSuggestWidget.foreground, -15) }, -- source of cmp. Ex: Lsp | Snippet
    CmpItemAbbr = { fg = c.editorSuggestWidget.foreground }, -- text that not match
    CmpItemAbbrDeprecated = { fg = c.editorSuggestWidget.foreground, strikethrough = true }, -- text not match of deprecated
    CmpItemKindArray = { fg = c.base.yellow },
    CmpItemKindBoolean = { fg = c.base.yellow },
    CmpItemKindClass = { fg = c.base.cyan },
    CmpItemKindColor = { fg = c.base.yellow },
    CmpItemKindConstant = { fg = c.base.orange },
    CmpItemKindConstructor = { fg = c.base.green },
    CmpItemKindEnum = { fg = c.base.cyan },
    CmpItemKindEnumMember = { fg = c.base.magenta },
    CmpItemKindEvent = { fg = c.base.yellow },
    CmpItemKindField = { fg = c.base.green },
    CmpItemKindFile = { fg = c.editorLineNumber.activeForeground },
    CmpItemKindFolder = { fg = c.editorLineNumber.activeForeground },
    CmpItemKindFunction = { fg = c.base.green },
    CmpItemKindInterface = { fg = c.base.cyan },
    CmpItemKindKey = { fg = c.base.red },
    CmpItemKindKeyword = { fg = c.base.red },
    CmpItemKindMethod = { fg = c.base.green },
    CmpItemKindModule = { fg = c.base.cyan },
    CmpItemKindNamespace = { fg = c.base.red },
    CmpItemKindNull = { fg = c.base.yellow },
    CmpItemKindNumber = { fg = c.base.yellow },
    CmpItemKindObject = { fg = c.base.yellow },
    CmpItemKindOperator = { fg = c.base.red },
    CmpItemKindPackage = { fg = c.base.red },
    CmpItemKindProperty = { fg = c.base.orange },
    CmpItemKindReference = { fg = c.base.yellow },
    CmpItemKindSnippet = { fg = c.base.yellow },
    CmpItemKindString = { fg = c.base.yellow },
    CmpItemKindStruct = { fg = c.base.cyan },
    CmpItemKindText = { fg = c.base.white },
    CmpItemKindTypeParameter = { fg = c.base.cyan },
    CmpItemKindUnit = { fg = c.base.magenta },
    CmpItemKindVariable = { fg = c.base.orange },
  }
end

return M
