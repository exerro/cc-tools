
local startup_file, name = ...

if not fs.isDir("/startup") then
	local tempFile

	if fs.exists("/startup") then
		tempFile = "/cc-tools/.temp_startup_file.lua"
		fs.move("/startup", tempFile)
	end

	fs.makeDir("/startup")

	if tempFile then
		fs.move(tempFile, "/startup/startup.lua")
	end
end

if not name then
	name = startup_file:gsub(".+/", ""):gsub("%.lua$", "")
end

fs.copy(startup_file, "/startup/" .. name .. ".lua")
