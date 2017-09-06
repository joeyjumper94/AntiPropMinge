concommand.Add("freeze_everything", function(ply)
	if ply:IsAdmin() then
		local anonymous = GetConVarNumber("apm_freeze_all_anonymity")
		print(ply:Nick().. " (".. ply:SteamID().. ") has frozen all props")

		apm_tab:EasyFPrint(ply:Nick().." ("..ply:SteamID()..") has frozen all props", anonymous)

		apm_tab:FreezeAll()
	elseif not(ply:IsValid()) then
		apm_tab:EasyFPrint("CONSOLE has frozen all props", 0)
		
		apm_tab:FreezeAll()
	end
end)