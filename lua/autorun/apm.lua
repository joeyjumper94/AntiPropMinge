if SERVER then
	include("apm/init.lua")
end
if CLIENT then
	concommand.Add( "apm_freeze_my_stuff", function(ply)
		if timer.Exists("apm_antispam_timer_cl") then
			ply:PrintMessage(HUD_PRINTTALK, "this function is on cooldown, you must wait "..math.Round(timer.TimeLeft("apm_antispam_timer_cl"),2).." before running this command")
		else
			timer.Create("apm_antispam_timer_cl", 3, 1, function() timer.Remove("apm_antispam_timer_cl") end)
			RunConsoleCommand("apm_freeze_ply_msg")
		end
	end)
end
concommand.Add( "apm_freeze_all_ents", function() RunConsoleCommand("apm_freeze_all_msg") end)
if CLIENT then
	concommand.Add( "apm_remove_my_stuff", function(ply)
		if timer.Exists("apm_antispam_timer_cl") then
			ply:PrintMessage(HUD_PRINTTALK, "this function is on cooldown, you must wait "..math.Round(timer.TimeLeft("apm_antispam_timer_cl"),2).." before running this command")
		else
			timer.Create("apm_antispam_timer_cl", 3, 1, function() timer.Remove("apm_antispam_timer_cl") end)
			RunConsoleCommand("apm_remove_ply_msg")
		end
	end)
end
concommand.Add( "apm_remove_all_ents", function() RunConsoleCommand("apm_remove_all_msg") end)

-- for some reason, the files don't do anything untill refreshed
if SERVER then
	concommand.Add("apm_restart", function(ply)
		if ply:IsValid() and ply:IsAdmin() then
			include("apm/init.lua")
		elseif !ply:IsValid() then
			include("apm/init.lua")
		end
	end)
	timer.Create("apm_refresher", 10, 6, function()
		include("apm/init.lua") -- by running this, we refresh the lua of the addon
	end)
end