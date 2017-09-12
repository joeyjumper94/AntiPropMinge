if SERVER then
	include("apm/init.lua")
end
include("apm/readme.lua")
if CLIENT then
	concommand.Add( "apm_freeze_my_stuff", function(ply)
		if timer.Exists("apm_antispam_timer_cl") then
			ply:PrintMessage(HUD_PRINTTALK, "this function is on cooldown, you must wait "..timer.TimeLeft("apm_antispam_timer").." before running this command")
		else
			timer.Create("apm_antispam_timer_cl", 5, 1, function() timer.Remove("apm_antispam_timer_cl") end)
			RunConsoleCommand("apm_freeze_ply_msg")
		end
	end)
end
concommand.Add( "apm_freeze_all_ents", function() RunConsoleCommand("apm_freeze_all_msg") end)

-- for some reason, the files doing anything untill refreshed
if SERVER then
	concommand.Add("apm_restart", function(ply)
		if ply:IsValid() and ply:IsAdmin() then
			include("apm/init.lua")
		elseif !ply:IsValid() then
			include("apm/init.lua")
		end
	end)
	timer.Create("apm_refresher", 10, 10, function()
		include("apm/init.lua") -- by running this, we refresh the lua of the addon
	end)
end