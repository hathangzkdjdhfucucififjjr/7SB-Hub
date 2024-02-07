local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local os = require("os")
local system = require("system")

local ramLimit = 70

function checkRAM()
 
  local totalRAM, usedRAM = os.totalmemory(), os.usedmemory()
  
  local ramUsage = math.floor((usedRAM / totalRAM) * 100)
  
  if ramUsage > ramLimit then
    
    local processes = system.listProcesses()
    for _, process in pairs(processes) do
    
      local processName, processRAM = process.name, process.memory
      
      if processRAM > 100 then
        system.kill(process.pid)
      end
    end
  end
end

function toggleAutoRAM()
  
  if autoRAM then
    timer = timer.create(checkRAM, 1000)
  else
  
    timer:stop()
  end
end

toggleAutoRAM()
