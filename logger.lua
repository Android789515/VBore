local function init()
   local logFile = fs.open("./opt/Vbore/log/log.txt", "w")

   return logFile, function(message)
      logFile.write(message)
      logFile.write("\n")
   end
end

return {
   init = init,
}
