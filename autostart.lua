------------------------------------------------------------
--- Autostart module for awesome
--
-- Autostart programs only once and not on restart
------------------------------------------------------------

local spawn = require("awful.util.spawn")
local dir = require("lfs.dir")

--- Return all current processes
-- All directories in /proc containing a number represent a process.
local function processwalker()
  local function yieldprocess()
    for dir in dir("/proc") do
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

-- Run a command if there is no existing process
local function run(command)
  assert(type(command) == "string")
  for process in processwalker() do
    if extract(denull(process)) == extract(command) then
      return
    end
  end
  return spawn(command)
end

return run
