local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    CopilotSuggestion = { fg = c.base.dimmed3, italic = true },
    CopilotAnnotation = { fg = c.base.dimmed4, italic = true },
  }
end

return M
