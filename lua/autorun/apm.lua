if SERVER then
	local file="apm/init.lua"
	include(file)
	AddCSLuaFile(file)
end

print("loaded Anti Prop Minge")
--[[
if SERVER then		

	AddCSLuaFile("apm.lua")
	local function add_files(dir)
		local files, folders = file.Find(dir .. "*", "LUA")
		
		for key, file_name in pairs(files) do
			AddCSLuaFile(dir .. file_name)
		end
		
		for key, folder_name in pairs(folders) do
			add_files(dir .. folder_name .. "/")
		end
	end
	
	add_files("apm/") 
end]]