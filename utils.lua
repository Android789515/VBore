local function prompt(promptString)
   write(promptString)

   local response = read()

   Log(string.format("%s response (%s)", promptString, response))

   return response
end

function Crash(message)
   Log(message)
   LogFile.close()

   shell.exit()
end

return {
   prompt = prompt,
}
