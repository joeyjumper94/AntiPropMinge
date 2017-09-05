local MurderEntBlackList={"prop_physics","gmod_balloon","gmod_button","gmod_hoverball","gmod_thruster"}
if SERVER then
	function GAMEMODE:PlayerDeath(ply,weapon,killer)--the hook to define the killer and the victim
		if IsValid(weapon) and table.concat(MurderEntBlackList):find(weapon:GetClass()) then
			if weapon:CPPIGetOwner()!=ply or GetConVarNumber("apm_prop_suicide_notification")!=0 then
				if ConVarExists("ulx_rslots") then-- check if ulx is installed
					RunConsoleCommand("ulx","asay", "someone spectate "..weapon:CPPIGetOwner():Nick().." ("..weapon:CPPIGetOwner():SteamID().."). A prop they own killed "..ply:Nick().." ("..ply:SteamID()..").")
				else
					for k,v in pairs(player.GetAll()) do
						if v:IsAdmin() then
							v:PrintMessage(HUD_PRINTTALK, "someone spectate "..weapon:CPPIGetOwner():Nick().." ("..weapon:CPPIGetOwner():SteamID().."). A prop they own killed "..ply:Nick().." ("..ply:SteamID()..").")
						end
					end
				end
			end
--			DarkRP.notify(ply, 0, 4, weapon:CPPIGetOwner():Name().." AKA "..weapon:CPPIGetOwner():Nick().." propkilled you" )
			for k, entity in pairs(ents.GetAll()) do
				if entity:IsValid() then
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
		end
	end
end