vim.g.system_id = vim.loop.os_uname().sysname

if vim.g.system_id == 'Linux' then
  local file = io.open('/etc/os-release', 'r')
  if file then
    local content = file:read '*all'
    file:close()
    if string.find(content, 'ID=nixos') then
      vim.g.system_id = 'nixos'
    end
  end
end
