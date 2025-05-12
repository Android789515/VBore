local utils = require("utils")
local lib = require("lib")
local logger = require("logger")

function Main()
   LogFile, Log = logger.init()

   lib.digLayerDown(
      tonumber(utils.prompt("Enter target depth: ")),
      tonumber(utils.prompt("Enter y level: ")),
      tonumber(utils.prompt("Enter size: "))
   )

   LogFile.close()
end

Main()
