local gpu = component.proxy(component.list("gpu")())
local screen = component.list("screen")()
gpu.bind(screen)
local w, h = gpu.getViewport()
local selected = 1
local list = {}

local targets = {"boot/kernel/pipes", "init.lua", "OS.lua"}
local desc, ver, noboot = "Use arrow, entry's index or click on it to boot", "v1.0 ©Dark Steveneq 2023", "No boot media found!"

local function cSel(f)
  gpu.setForeground(0xCAD3F5)
  if f then
    gpu.setBackground(0x494D64)
  else
    gpu.setBackground(0x24273A)
  end
end

--drawcludeMarker

if gpu.getDepth() == 1 then
  cSel = function(f)
    if f then
      gpu.setForeground(0x000000)
      gpu.setBackground(0xFFFFFF)
    else
      gpu.setForeground(0xFFFFFF)
      gpu.setBackground(0x000000)
    end
  end
  ld = nil
end

local function re(i, d, f)
  cSel(f)
  local l = tostring(i) .. ". " .. (d[2] or "No Label") .. " (" .. d[1] .. ")"
  gpu.set(w / 2 - #l / 2, h / 2 + i, l)  
end

local function pop()
  cSel()
  gpu.fill(1, h / 2, w, h / 2 - 2, " ")
  selected = 1
  list = {}
  for addr in component.list("filesystem") do
    local v = false
    for _, file in pairs(targets) do
      if v == false and component.invoke(addr, "exists", file) then
        v = true
        table.insert(list, {addr, component.invoke(addr, "getLabel"), file})
      end
    end
  end
  if #list == 0 then
    gpu.set(w / 2 - #noboot / 2, h / 2, noboot)
  else
    for index, data in pairs(list) do
      re(index, data, index == 1)
    end
  end
end

local function foc(sel)
  if not list[sel] then return end
  re(selected, list[selected], false)
  selected = sel
  re(selected, list[selected], true)
end

local function boot()
  cSel()
  gpu.fill(1, 1, w, h, " ")

  local f = list[selected]
  function _G.computer.getBootAddress() return f[1] end
  function _G.computer.setBootAddress(a) f[1] = a end
  component.proxy(component.list("eeprom")()).setData(f[1])

  local fs, b = component.proxy(f[1]), ""
  local h, r = fs.open(f[3])
  if not h then error(r) end
  repeat
    local d = fs.read(h, math.maxintiger or math.huge)
    b = b .. (d or "")
  until not d

  local pro, r = load(b)
  if pro then
    local err = table.pack(pro())[2]
    if err then error(err) end
  else error(r) end
end

local function sig(n, ...)
  if n:find("component_") and select(2, ...) == "filesystem" then
    pop()
  elseif n == "touch" then
    local sel = -(h / 2 - select(3, ...))
    if sel > 0 and sel <= #list then
      foc(sel)
      boot()
    end
  elseif n == "key_down" then
    local c = select(3, ...)
    if c == 200 and selected - 1 > 0 then
      foc(selected - 1)
    elseif c == 208 and selected + 1 <= #list then
      foc(selected + 1)
    elseif c - 1 > 0 and c - 1 <= #list then
      foc(c - 1)
      boot()
    elseif c == 28 or c == 57 then
      boot()
    end
  end
end

cSel()
gpu.fill(1, 1, w, h, " ")
gpu.set(w / 2 - #desc / 2, h - 2, desc)
gpu.set(w + 2 - #ver, h, ver)
if ld then
  gpu.set(w / 2 - 4, 10, "CatBoot")
  ld()
else
  gpu.set(w / 2 - 4, 3, "CatBoot")
end
pop()
while true do
  sig(computer.pullSignal())
end