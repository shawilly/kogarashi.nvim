local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    HarpoonWindow = { link = "NormalFloat" },
    HarpoonBorder = { link = "FloatBorder" },
    HarpoonTitle = { fg = c.base.red, bold = true },
    HarpoonActive = { fg = c.base.green, bold = true },
    HarpoonInactive = { fg = c.base.dimmed2 },
  }
end

return M
