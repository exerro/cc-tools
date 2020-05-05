
local install_path = ...

if not install_path then
	install_path = "/" .. shell.getRunningProgram():gsub("/setup.lua", "")
end

if not fs.isDir("/startup") then
	local tempFile

	if fs.exists("/startup") then
		tempFile = "/.__cc_tools_temp_startup.lua"
		fs.move("/startup", tempFile)
	end

	fs.makeDir("/startup")

	if tempFile then
		fs.move(tempFile, "/startup/startup.lua")
	end
end

local contenth = io.open(install_path .. "/bin/startup.lua", "r")
local content = contenth:read "*a"
contenth:close()

local h = io.open("/startup/cc_tools.lua", "w")
h:write((content:gsub("$INSTALL_PATH", install_path)))
h:close()
