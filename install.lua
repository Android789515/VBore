shell.run("wget", "https://raw.githubusercontent.com/Konijima/cc-git-clone/master/gitclone.lua")

shell.run("gitclone", "Android789515", "Vbore", "main", "opt")

shell.run("mv", "opt/Vbore/V-Bore.lua", "/")
