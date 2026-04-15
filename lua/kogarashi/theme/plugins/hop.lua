local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    HopNextKey = { fg = c.base.orange, bold = true },
    HopNextKey1 = { fg = c.base.yellow, bold = true },
    HopNextKey2 = { fg = c.base.cyan },
    HopUnmatched = { fg = c.base.dimmed4 },
  }
end

return M
