local function init()
   local logFile = fs.open("./log/log.txt", "w")
   
   return logFile, function (message)
      logFile.write(message)
   end
end

return {
   init = init,
}
