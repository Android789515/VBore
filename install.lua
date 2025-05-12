local hasGitClone = shell.resolve("gitclone")

if not(hasGitClone) then
   shell.run("wget", "https://raw.githubusercontent.com/Konijima/cc-git-clone/master/gitclone.lua")
end

shell.run("gitclone", "Android789515", "Vbore", "main", "opt")

shell.run("mv", "opt/Vbore/V-Bore.lua", "/")
