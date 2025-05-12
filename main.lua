local utils = require("utils");
local lib = require("lib");
local logger = require("logger");

function Main()
   local file, log = logger.init()

   local depthTarget = tonumber(utils.prompt("Enter Depth: "))
   log(string.format("Depth Target: %i", depthTarget))

   local currentY = tonumber(utils.prompt("Enter current Y: "))
   log(string.format("Current Y: %i", currentY))

   local holeSize = tonumber(utils.prompt("Enter Hole Size: "))
   log(string.format("Hole Size: %i", holeSize))

   local isOdd = holeSize % 2 == 1

   local depthTargetAtFeet = depthTarget - 1

   for _ = currentY, depthTargetAtFeet, -1 do
      lib.startLayer()
      log(string.format("Starting a new layer at a depth of: %i", currentY - depthTargetAtFeet))

      if isOdd then
         lib.digOdd(holeSize, log)
      else
         lib.digEven(holeSize)
      end
   end

   file.close()
end

Main()
