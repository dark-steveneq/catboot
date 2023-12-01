local file, reason = io.open("drawer.lua", "r")
if not file then
  error(reason)
end
local content = file:read("*a")
file:close()

file, reason = io.open("eeprom.lua", "r")
if not file then
  error(reason)
end
content = file:read("*a"):gsub("--drawcludeMarker", content)
file:close()

file, reason = io.open("eeprom.dr.lua", "w")
if not file then
  error(reason)
end
file:write(content)
file:close()