local function prompt(PromptString)
   write(PromptString)

   return read()
end

return {
   prompt = prompt,
}
