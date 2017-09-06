concommand.Add("apm_freeze_all_msg", function(ply)
	if ply:IsValid() and ply:IsAdmin() then
		local anonymous = GetConVarNumber("apm_freeze_all_anonymity")
		print(ply:Nick().. " (".. ply:SteamID().. ") has frozen all props")

		apm_tab:EasyFPrint(ply:Nick().." ("..ply:SteamID()..") has frozen all props", anonymous)

		apm_tab:FreezeAll()
	elseif !ply:IsValid() then
		apm_tab:EasyFPrint("CONSOLE has frozen all props", 0)
		
		apm_tab:FreezeAll()
	elseif ply:IsValid() then
		ply:PrintMessage(HUD_PRINTTALK, "you need to be an admin to do that")
	end
end)
--[[
concommand.Add("apm_freeze_all_msg", function(ply)
	if ply:IsValid() and ply:IsAdmin() then
		print(ply:Nick().." ("..ply:SteamID()..") has frozen all props")
		for k,v in pairs(player.GetAll()) do
			if GetConVarNumber("apm_freeze_all_anonymity")==0 or v:IsAdmin() then
				v:PrintMessage(HUD_PRINTTALK, ply:Nick().." ("..ply:SteamID()..") has frozen all props")
			else
				v:PrintMessage(HUD_PRINTTALK, "someone has frozen all props")
			end
		end

		for k, entity in pairs(ents.GetAll()) do
			if entity:IsValid() then
				local phys = entity:GetPhysicsObject()
				if phys:IsValid() then
					phys:EnableMotion(false)
					phys:Sleep()
				end
			end
		end
	elseif !ply:IsValid() then
		print("you have frozen all props")
		for k,v in pairs(player.GetAll()) do
			if GetConVarNumber("apm_freeze_all_anonymity")==0 or v:IsAdmin() then
				v:PrintMessage(HUD_PRINTTALK, "CONSOLE has frozen all props")
			else
				v:PrintMessage(HUD_PRINTTALK, "someone has frozen all props")
			end
		end

		for k, entity in pairs(ents.GetAll()) do
			if entity:IsValid() then
				local phys = entity:GetPhysicsObject()
				if phys:IsValid() then
					phys:EnableMotion(false)
					phys:Sleep()
				end
			end
		end
	elseif ply:IsValid() then
		ply:PrintMessage(HUD_PRINTTALK, "you need to be an admin to do that")
	end
end)]]
