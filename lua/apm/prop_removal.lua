concommand.Add("apm_remove_ply_msg", function(ply)
	if ply:IsValid() and timer.Exists("apm_antispam_timer") then
		ply:PrintMessage(HUD_PRINTTALK, "this function is on cooldown, wait "..math.Round(timer.TimeLeft("apm_antispam_timer"),2).." before running this command")
	elseif ply:IsValid() then
		timer.Create("apm_antispam_timer", 3, 1, function() timer.Remove("apm_antispam_timer") end)
		apm_tab:RemoveOnly(ply)
	else
		print'this function only works when used by players in game'
	end
end)

concommand.Add("apm_remove_ply_all", function(ply)
	if ply:IsValid() and !ply:IsAdmin() then
		ply:PrintMessage(HUD_PRINTTALK, "you need to be a admin to do that")
		return
	end
	for k,v in pairs(player.GetAll()) do
		apm_tab:RemoveOnly(v)
		if !ply:IsValid() then 
			v:PrintMessage(HUD_PRINTTALK, "CONSOLE has removed all player owned props")
		elseif v==ply then
			v:PrintMessage(HUD_PRINTTALK, "you removed all player owned entities")
		else
			v:PrintMessage(HUD_PRINTTALK, ply:Nick().." ( "..ply:SteamID().." ) has removed all player owned entities")
		end
	end
end)

concommand.Add("apm_remove_all_msg", function(ply)	
	if ply:IsValid() then
		if ply:IsAdmin() then
			ServerLog(ply:Nick().. " (".. ply:SteamID().. ") has reset the map")

			PrintMessage(HUD_PRINTTALK,ply:Nick().." ("..ply:SteamID()..") has reset the map")

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

