concommand.Add("apm_remove_ply_msg", function(ply)
	if ply:IsValid() and timer.Exists("apm_antispam_timer") then
		ply:PrintMessage(HUD_PRINTTALK, "this function is on cooldown, you must wait "..timer.TimeLeft("apm_antispam_timer").." before running this command")
	elseif ply:IsValid() then
		timer.Create("apm_antispam_timer", 3, 1, function() timer.Remove("apm_antispam_timer") end)
		local lply = ply
		apm_tab:RemoveOnly(lply)
	else
		print('this function only works when used by players in game')
	end
end)


concommand.Add("apm_remove_all_msg", function(ply)	
	if ply:IsValid() then
		if ply:IsAdmin() then
			ServerLog(ply:Nick().. " (".. ply:SteamID().. ") has reset the map")

			apm_tab:EasyFPrint(ply:Nick().." ("..ply:SteamID()..") has reset the map", 0)

			game.CleanUpMap( false, {} )
		else
			ply:PrintMessage(HUD_PRINTTALK, "you need to be an admin to do that")	
		end
	else
		apm_tab:EasyFPrint("CONSOLE has reset the map", 0)
		ServerLog("CONSOLE has reset the map")
		game.CleanUpMap( false, {} )
	end
end)