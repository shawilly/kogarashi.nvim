local config = require("kogarashi.config")
local util = require("kogarashi.util")
local theme = require("kogarashi.theme")

---@class Kogarashi
local M = {}

M.load = function()
  util.theme.load(theme.setup())
end

M.setup = function(options)
  config.setup(options)
end

return M
