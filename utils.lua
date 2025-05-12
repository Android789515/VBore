local function prompt(PromptString)
   write(PromptString)

   local response = read()

   Log(response)

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
