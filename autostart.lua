----------------------------------------------------------------------
--- Autostart module for awesome
--
-- Start programs only once, not on restart
----------------------------------------------------------------------

local awful = require("awful")
local lfs = require("lfs")

--- Return all current processes
-- All directories in /proc containing a number represent a process.
local function processwalker()
  local function yieldprocess()
    for dir in lfs.dir("/proc") do
      if tonumber(dir) ~= nil then
        local f, err = io.open("/proc/"..dir.."/cmdline")
        if f then
          local cmdline = f:read("*all")
          f:close()
          if cmdline ~= "" then
            coroutine.yield(cmdline)
          end
        end
      end
    end
  end
  return coroutine.wrap(yieldprocess)
end

-- Replace NUL-separation with spaces
local function denull(string)
  return string.gsub(string, "\0", " ")
end

-- Extract core command name
local function extract(string)
  return string.match(string.match(string, "^%S*"), "[^/]-$") or ""
end

--- Run command if there is no existing process
-- Takes a command with arguments as a single string
local function run(command)
  assert(type(command) == "string")
  for process in processwalker() do
    if extract(denull(process)) == extract(command) then
      return
    end
  end
  return awful.util.spawn(command)
end

return run
