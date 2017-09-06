if SERVER then
	include("apm/init.lua")
	AddCSLuaFile()
end
if CLIENT then
	concommand.Add( "apm_freeze_my_stuff", function() RunConsoleCommand("apm_freeze_ply_msg") end)
end
concommand.Add( "apm_freeze_all_ents", function() RunConsoleCommand("apm_freeze_all_msg") end)

-- for some reason, the files doing anything untill refreshed
if SERVER then
	timer.Create("apm_refresher", 10, 10, function()
		include("apm/init.lua") -- by running this, we refresh the lua of the addon
	end)
end