
local install_path = ...
local startup_path

if not install_path then
	install_path = "/" .. shell.getRunningProgram():gsub("/setup.lua", "")
end

startup_path = "/" .. install_path .. "/.temp_new_startup.lua"

local contenth = io.open(install_path .. "/bin/startup.lua", "r")
local content = contenth:read "*a"
contenth:close()

local h = io.open(startup_path, "w")
h:write((content:gsub("$INSTALL_PATH", install_path)))
h:close()

shell.run(install_path .. "/bin/make-startup", startup_path, "cc-tools")
fs.delete(startup_path)
