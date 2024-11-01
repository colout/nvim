-- Doing this the lazy way to start.
-- Setting up global state without much protections, but can come later

local M = {}

M.get_value = function(key)
  return M[key]
end

M.set_value = function(key, value)
  M[key] = value
end

return M
