local MurderEntBlackList={"prop_physics","prop_ragdoll","gmod_balloon","gmod_button","gmod_hoverball","gmod_thruster"}
if SERVER then
	function GAMEMODE:PlayerShouldTakeDamage(ply,weapon)
		if IsValid(weapon) and table.concat(MurderEntBlackList):find(weapon:GetClass()) then
			if (weapon:CPPIGetOwner()!=ply or GetConVarNumber("apm_prop_suicide_notification")!=0) and GetConVarNumber("apm_notify_on_damage")!=0 then
				if ConVarExists("ulx_rslots") then
					RunConsoleCommand("ulx","asay", "someone spectate "..weapon:CPPIGetOwner():Nick().." ("..weapon:CPPIGetOwner():SteamID().."). A prop they own killed "..ply:Nick().." ("..ply:SteamID()..").")
				else
					for k,v in pairs(player.GetAll()) do
						if v:IsAdmin() then
							v:PrintMessage(HUD_PRINTTALK, "someone spectate "..weapon:CPPIGetOwner():Nick().." ("..weapon:CPPIGetOwner():SteamID().."). A prop they own damaged "..ply:Nick().." ("..ply:SteamID()..").")
						end
					end
				end
			end
			for k, entity in pairs(ents.GetAll()) do
				if entity:IsValid() and GetConVarNumber("apm_freeze_on_damage")!=0 then
					local phys = entity:GetPhysicsObject()
					if phys:IsValid() and weapon:CPPIGetOwner()==entity:CPPIGetOwner() then
						phys:EnableMotion(false)
						phys:Sleep()
						local ed = EffectData()
						ed:SetEntity(entity)
						util.Effect( "entity_remove", ed, true, true )
					end
				end
			end
			return GetConVarNumber("apm_allow_prop_damage")!=0
		else
			return true
		end
	end
end