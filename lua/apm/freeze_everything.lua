if SERVER then
	concommand.Add("freeze_everything", function(ply)
		if ply:IsValid() and ply:IsAdmin() then
			print(ply:Nick().." ("..ply:SteamID()..") has frozen all props")
			for k,v in pairs(player.GetAll()) do
				if GetConVarNumber("freeze_all_anonymity_level")==0 or v:IsAdmin() then
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
		elseif ply:IsValid() then
			ply:PrintMessage(HUD_PRINTTALK, "you need to be an admin to do that")
		else
			print('"freeze_everything" only works when used by admins in game')
		end
	end)
end
CreateConVar("freeze_all_anonymity_level", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decides if freezall is annonymous to non admins")