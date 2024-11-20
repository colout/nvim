-- Okay, I over-complicated this.  It's only for 'wqa' combinations I use often (plus shabangs).
-- I could have just manually unwrapped all permutations in one table and it would have been fewer lines of code and more performant.
-- I'll leave it for now because it was a fun experiment and might be a bit useful later
-- ...maybe this is a good plugin ides?

-- Lifted from https://stackoverflow.com/questions/33464037/find-all-upper-lower-mixed-combinations-of-a-string
local function generate_capitalization_permutations(t, s1, s2)
  if s2:len() > 0 then
    local c = s2:sub(1, 1)
    local l = c:lower()
    local u = c:upper()
    if l == u then
      generate_capitalization_permutations(t, s1 .. c, s2:sub(2))
    else
      generate_capitalization_permutations(t, s1 .. l, s2:sub(2))
      generate_capitalization_permutations(t, s1 .. u, s2:sub(2))
    end
  else
    table.insert(t, s1)
  end
  return t
end

-- Creates table of {incorrect_cap},{correct_cap} to iterate through and alias below
local function table_for_command_capitalization_correction(cmd)
  local bad_cmds = generate_capitalization_permutations({}, "", cmd)
  local cmds = {}

  for _, bad_cmd in ipairs(bad_cmds) do
    cmds[bad_cmd] = cmd
    cmds[bad_cmd .. "!"] = cmd .. "!" -- Fix for shebang too!
  end

  return cmds
end

-- Given a command, will create aliases for all possible mis-capitalizatiosn
local function create_aliases_for_all_capitalizations(command)
  for bad_cmd, cmd in pairs(table_for_command_capitalization_correction(command)) do
    vim.cmd.cnoreabbrev(bad_cmd .. " " .. cmd)
  end
end

local cmds = {
  "w",
  "q",
  "wq",
  "qa",
  "wqa",
}
for _, cmd in ipairs(cmds) do
  create_aliases_for_all_capitalizations(cmd)
end
